module Admin
	class DiagramsController < AdminController
		def amounts
			sql = %Q[
select balance_date, sum(product_amount) as amount
from balances 
group by balance_date
]
	    r = ActiveRecord::Base.connection.execute(sql)
			@total_amounts = []
			r.each do |d| 
   			@total_amounts << [d[0].to_time.to_i * 1000, d[1]] 
			end 

			sql = %Q[
select balance_date, product_id, sum(product_amount) as amount
from balances 
where product_id is not null
group by balance_date, product_id
order by product_id, balance_date
]
			r = ActiveRecord::Base.connection.execute(sql)
			prod = -1
			@product_amounts = []
			dt = []
			r.each do |d|
				if d[1] != prod
					@product_amounts << dt if dt.count > 0
					dt = []
					prod = d[1]
				end
   			dt << [d[0].to_time.to_i * 1000, d[2]] 
			end 
			@product_amounts << dt if dt.count > 0

			sql = %Q[
select  product_id, sum(product_amount) as amount
from balances 
where product_id is not null 
   and DATE_SUB(CURDATE(), INTERVAL 30 DAY) <= balance_date
group by  product_id
order by product_id
]
			r = ActiveRecord::Base.connection.execute(sql)
			s = []
			r.each do |d| 
				p = {}
				p[:label] = d[0]
				p[:data] = d[1]
				s << "{label: '#{d[0]}', data: #{d[1]}}"
			end
			@pie = "[" + s.join(', ') + "]" 

		end
	end
end