class Balance < ActiveRecord::Base
	belongs_to :companies
	belongs_to :products
	belongs_to :clients
end
