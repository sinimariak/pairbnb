class ListingsController < ApplicationController

	def index
		@listing = Listing.new
		if params[:tag]
			@listings = Listing.tagged_with(params[:tag])
		else params[:search]
			@listings = Listing.all
		end
	end

	def new
		@listing = Listing.new
	end

	def create
		@listing = current_user.listings.new(listing_params)
		if @listing.save
			redirect_to @listing
		else 
			redirect_to new_listing_path, alert: "Error creating listing."
		end
    end

    def show
    	@listing = Listing.find(params[:id])
	end

	def listing_params
    	params.require(:listing).permit(:city, :hometype, :roomtype, :accommodates, :available_from, :available_until, :price, :currency, :user_id)
    end
end

