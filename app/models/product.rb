class Product < ActiveRecord::Base
	has_many :channels
	has_many :agreements
	has_many :balances

	default_scope :order => 'channel_number'
end
