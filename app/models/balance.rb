class Balance < ActiveRecord::Base
	belongs_to :company
	belongs_to :product
	belongs_to :client
	belongs_to :agreement

	scope :new_input, where('status<10')
	scope :checked, where('status=1')
	scope :history, where('status>=10')
	default_scope order('balance_date desc')
end
