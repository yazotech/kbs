class Channel < ActiveRecord::Base
	belongs_to :client
	belongs_to :product
   	validates :channel_number, :presence => true, :uniqueness => true
end
