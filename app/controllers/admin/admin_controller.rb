module Admin
	class AdminController < ActionController::Base
		  before_filter :authenticate_user!
		layout 'admin'
	end
end