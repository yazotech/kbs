class BalancesController < ApplicationController
	respond_to :html, :xml, :json

	def index
		@b = Balance.order('balance_date desc').limit(10)
		respond_with(@b)
	end
	def show
		@b = Balance.find(params[:id])
		respond_with(@b)
	end

	def login
		username = params[:u]
		password = params[:p]

		@b = '{}'
		if username  && password
			u = User.find_by_login_name(username)
			if u && u.valid_password?(password)
				@b = {}
				@b[:login_name] = u.login_name
				ui = u.user_info
				if ui
					@b[:client_id] = ui.client_id
					if ui.client
						@b[:client_name] = ui.client.name 
					else
						@b[:client_name] = "{未知用户}"
					end
				end
			end
		end
		respond_with(@b)
	end

	def q
		month = params[:month]
		client_id = params[:client_id]
		if month
			@b = Balance.where(:client_id => client_id).where('count is not null and count>0').where(["balance_date like ?", month + '%'])
		else
			@b = []
		end
		respond_with(@b)
	end

	def s
		client_id = params[:client_id]
		month = params[:month]
	end

	def month_list
		@list = []
		ml = ActiveRecord::Base.connection.execute("select  distinct substr(balance_date,1,7) from balances where client_id=#{params[:client_id]} order by balance_date")
		ml.each do |m|
			@list << [m[0],m[0]]
		end
		respond_with(@list)
	end
	def ch
		login_name = params[:login_name]
		password = params[:p]
		@u = User.find_by_login_name(params[:login_name])
	 if @u
			@u.password = password
			@u.save
	 end
	     respond_with(@u)
	end
end