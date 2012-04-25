module Admin
  class UsersController < ResourceController
    create.before :add_user_info

  	def add_user_info
  		@object.build_user_info
  	end

  end
end
