module Admin
  class ClientsController < ResourceController
    update.after :update_channels

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
  end
end
