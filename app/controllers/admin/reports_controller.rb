module Admin
	class ReportsController < AdminController
		def index
			@product_by_month = Balance.find_by_sql('select sum(count) as count, substr(balance_date,1,7) as ba_date ,product_id as pro from balances group by ba_date,pro')
			@client_by_month = Balance.find_by_sql('select sum(count) as count, substr(balance_date,1,7) as ba_date ,client_id as cli from balances group by ba_date,cli')
		end
		def monthly_sumary
			sql = %Q[
				select 
					sum(count) as count, 
					substr(balance_date,1,7) as b_date,
					sum(product_amount) as product_amount
				from balances 
				group by b_date
				]
			@sum_by_month = Balance.find_by_sql(sql)
		end

		def wap_read
			if params[:date]
				sql = %Q[
				select substr(balance_date,1,10) as balance_date,product_id as pro,price,count,amount from balances where company_id=1 and channel_number like '031%' and balance_date like '%#{params[:date]}%' group by balance_date,pro
			]
             else
			sql = %Q[
					select substr(balance_date,1,10) as balance_date,product_id as pro,price,count,amount from balances where company_id=1 and channel_number like '031%' group by balance_date,pro
				]				
			end
             @wap_read = Balance.find_by_sql(sql)
	     end

		 def mm_data
		 	if params[:date]
				sql = %Q[
				select substr(balance_date,1,10) as balance_date,product_id as pro,price,count,dz_count,amount from balances where company_id=1 and channel_number like '140%' and balance_date like '%#{params[:date]}%' group by balance_date,pro
			]
             else
			sql = %Q[
					select substr(balance_date,1,10) as balance_date,product_id as pro,price,count,dz_count,amount from balances where company_id=1 and channel_number like '140%' group by balance_date,pro
				]				
			end
             @mm_data = Balance.find_by_sql(sql)
		 end

		 def yz_caixin
		 	if params[:date]
				sql = %Q[
				select substr(balance_date,1,10) as balance_date,product_id as pro,price,count,dz_count,
				amount,product_amount from balances where company_id=1 and
				 channel_number like '0_01%' and balance_date like '%#{params[:date]}%' group by balance_date,pro
			]
             else
			sql = %Q[
					select substr(balance_date,1,10) as balance_date,
					product_id as pro,price,count,dz_count,amount,product_amount from balances 
					where company_id=1 and channel_number like '0_01%' group by balance_date,pro
				]				
			end
             @yz_caixin = Balance.find_by_sql(sql)
		 end

		  def zy_caixin
		 	if params[:date]
				sql = %Q[
				select substr(balance_date,1,10) as balance_date,product_id as pro,price,count,dz_count,
				amount,product_amount from balances where company_id=2 and
				 channel_number like '0_01%' and balance_date like '%#{params[:date]}%' group by balance_date,pro
			]
             else
			sql = %Q[
					select substr(balance_date,1,10) as balance_date,
					product_id as pro,price,count,dz_count,amount,product_amount from balances 
					where company_id=2 and channel_number like '0_01%' group by balance_date,pro
				]				
			end
             @zy_caixin = Balance.find_by_sql(sql)
		 end

	end
end