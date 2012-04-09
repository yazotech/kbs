module Admin
  class ChannelsController < ResourceController
    def checkpro
      Product.all.each do |p|
        Channel.where(:product_id => nil) \
          .where("channel_number like '#{p.channel_number.strip}%'") \
          .update_all(:product_id => p.id) if p.channel_number
  		end
      redirect_to :action => :index
  	end
  end
end
