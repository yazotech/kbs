module Admin
	class HomeController < AdminController
		def index
			render :text => 'Admin-Home!!'
		end
	end
end