module Admin
	class AdminController < ActionController::Base
		  before_filter :authenticate_emp!
		layout 'admin'
	end
end