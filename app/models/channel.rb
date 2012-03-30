class Channel < ActiveRecord::Base
	belongs_to :clients
	belongs_to :products
end
