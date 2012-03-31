class Company < ActiveRecord::Base
	has_many :agreements
	has_many :balances
end
