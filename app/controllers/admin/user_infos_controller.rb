module Admin
  class UserInfosController < ResourceController
  	def seachuser
  		@u = User.all
  	end
  end
end
