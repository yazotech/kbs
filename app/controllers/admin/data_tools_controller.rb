module Admin
	class DataToolsController < AdminController
		def index
		end
		def balances_product_id
			sql = %Q[
update balances, channels set balances.product_id = channels.product_id
where balances.product_id is null
and channels.channel_number = balances.channel_number]
			ActiveRecord::Base.connection.execute(sql)
			redirect_to :action => :index
		end
	end
end