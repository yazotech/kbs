module Admin
  class ChannelsController < ResourceController
    def checkpro
  	Product.all.each do |p|
  		s = p.channel_number.length if p.channel_number
  		Channel.where(:product_id => nil).each do |c|
  			#debugger
  			cn = c.channel_number.slice(0,s)
  			if p.channel_number==cn 
  				c.product_id = p.id
  				c.save

  			end
  		end
  	end
  	  redirect_to :action => :index, :controller => :channels
  end
  end
end
