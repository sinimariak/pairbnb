class Listing < ActiveRecord::Base
	belongs_to :user
	has_many :reservations, :dependent => :destroy
	searchkick
	mount_uploader :image, ImageUploader
end

