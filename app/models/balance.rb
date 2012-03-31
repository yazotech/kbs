class Balance < ActiveRecord::Base
	belongs_to :company
	belongs_to :product
	belongs_to :client
	belongs_to :agreement

	scope :new_input, where(:status => 0)
end
