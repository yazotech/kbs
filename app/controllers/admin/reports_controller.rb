module Admin
	class ReportsController < AdminController
		def index
			@product_by_month = Balance.find_by_sql('select sum(count) as count, substr(balance_date,1,7) as ba_date ,product_id as pro from balances group by ba_date,pro')
			@client_by_month = Balance.find_by_sql('select sum(count) as count, substr(balance_date,1,7) as ba_date ,client_id as cli from balances group by ba_date,cli')
			@sum_by_month = Balance.find_by_sql('select sum(count) as count, substr(balance_date,1,7) as ba_date from balances group by ba_date')
		end
		def balances_monthly_sumary
			
		end
	end
end