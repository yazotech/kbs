class Channel < ActiveRecord::Base
	belongs_to :company
	belongs_to :product
end
