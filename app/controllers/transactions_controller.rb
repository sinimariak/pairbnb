class TransactionsController < ApplicationController

	def new
 	gon.client_token = generate_client_token
 	@reservation = Reservation.where(user_id: current_user.id).last
 	@listing = Listing.find(@reservation.listing_id)
 	length_of_stay = @reservation.check_out - @reservation.check_in
  @total_price = @listing.price.to_s.to_f.round(2) * length_of_stay
	end

	def create
		#result will give you a set of params, transaction id provided by paypal would be worth keeping in the db
    @result = Braintree::Transaction.sale(amount: params[:price], payment_method_nonce: params[:payment_method_nonce])
    if @result.success?
    	Transaction.create(reservation_id: params[:reservation])
      redirect_to user_reservations_path(current_user.id), notice: "Transaction processed!"
    else
      flash[:alert] = "Something went wrong while processing your transaction. Please try again!"
      gon.client_token = generate_client_token
      render :new
    end
  end

	private
	def generate_client_token
  	Braintree::ClientToken.generate
	end

end
