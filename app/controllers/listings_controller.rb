class ListingsController < ApplicationController

	def index
		Listing.reindex
		@listings = Listing.search(params[:search])
	end

	def new
		@listing = Listing.new
	end

	def create
		@user = current_user

		@listing = @user.listings.new(listing_params)
		if @listing.save
			redirect_to listings_path
		else 
			redirect_to new_listing_path, alert: "Error creating listing."
		end
    end

    def show
    	@listing = Listing.find(params[:id])
    	@reservation = @listing.reservations.new
	end

	def listing_params
    	params.require(:listing).permit(:title, :city, :hometype, :roomtype, :accommodates, :available_from, :available_until, :price, :currency, :user_id, :image)
    end
end

