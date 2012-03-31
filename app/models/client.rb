class Client < ActiveRecord::Base
	has_many :channels
	has_many :balances
	has_many :agreements
end
