class ReservationMailer < ApplicationMailer
	default from: 'reservations.mybnb@gmail.com'

	def reservation_email(user)
    	@user = user
    	mail(to: @user.email, subject: 'You have received a reservation from myBnB')
  	end
end
