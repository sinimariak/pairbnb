# require 'elasticsearch/model'

class Listing < ActiveRecord::Base
	belongs_to :user
	# include Elasticsearch::Model
 #  	include Elasticsearch::Model::Callbacks

end

# Listing.import
