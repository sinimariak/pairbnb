class ReservationsController < ApplicationController

	def index
		@reservation = Reservation.new
		@reservations = Reservation.all
	end

	def new
		@reservation = Reservation.new
	end

	def create
		@reservation = current_user.reservations.new(reservation_params)
		if @reservation.save
		redirect_to new_transaction_path
		else 
		redirect_to root_path
		end
    end

    def reservation_params
    	params.require(:reservation).permit(:city, :check_in, :check_out, :guests, :user_id, :listing_id)
    end
end
