# require 'elasticsearch/model'

class Listing < ActiveRecord::Base
	belongs_to :user
	has_many :reservations, :dependent => :destroy
	# include Elasticsearch::Model
 #  	include Elasticsearch::Model::Callbacks

end

# Listing.import
