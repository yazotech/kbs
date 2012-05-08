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
			flash[:notice] = 'Table:balances, product_id updated.'
			redirect_to :action => :index
		end
		def balances_dz_count
			sql = %Q[
update balances set dz_count = count 
where (dz_count is null or dz_count = 0) and count > 0
]
			ActiveRecord::Base.connection.execute(sql)
			flash[:notice] = 'Table:balances, dz_count updated.'
			redirect_to :action => :index
		end
		def balances_product_price
			sql = %Q[
update balances, products
set product_price = products.price,
    product_amount = balances.dz_count * products.price
where (balances.product_amount is null or balances.product_amount = 0)
    and products.id = balances.product_id
]
			ActiveRecord::Base.connection.execute(sql)
			flash[:notice] = 'Table:balances, product_amount updated.'
			redirect_to :action => :index			
		end
	end
end