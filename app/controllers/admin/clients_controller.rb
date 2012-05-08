module Admin
  class ClientsController < ResourceController
    update.after :update_channels
    create.after :auto_add_user


  	def add_user
  		load_object
  		ui = UserInfo.new
  		ui.build_user
  		@object.user_infos << ui
      ui.save
  		render :text => 'ok'
  	end
  	
  	def update_channels
	  	if params[:rm_channels]
		  	params[:rm_channels].each do |ch_id, b|
		  		ch = Channel.find(ch_id)
		  		@object.channels.delete(ch) if @object.channels.include?(ch)
		  	end
	  	end
	  	if params[:add_channels]
	  		params[:add_channels].each do |ch_id, b|
	  			ch = Channel.find(ch_id)
	  			@object.channels << ch unless @object.channels.include?(ch)
	  		end
	  	end
  	end

    def auto_add_user
      ui = UserInfo.new
      ui.build_user
      ui.user.login_name = 'A' + @object.id.to_s
      @object.user_infos << ui
      ui.save
    end

  end
end
