class ReservationsController < ApplicationController

	def index
		@reservation = Reservation.new
		@reservations = Reservation.all
	end

	def new
		@reservation = Reservation.new
	end

	def create
		@reservation = current_user.reservation.new(reservation_params)
		if @reservation.save
		redirect_to reservations_path alert: "Booked!"
		else 
		redirect_to root_path alert: "Error creating listing."
		end
    end

    def reservation_params
    	params.require(:reservation).permit(:city, :check_in, :check_out, :guests, :user_id, :listing_id)
    end
end
