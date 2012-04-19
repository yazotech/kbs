class BalancesController < ApplicationController
	respond_to :html, :xml, :json

	def index
		@b = Balance.limit(10)
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
				@b[:client_id] = u.user_info.client_id if u.user_info
			end
		end
		respond_with(@b)
	end

	def q
		month = params[:month]
		client_id = params[:client_id]
		if month
			@b = Balance.where(:client_id => client_id).where(["balance_date like ?", month + '%'])
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
		ml = ActiveRecord::Base.connection.execute("select distinct substr(balance_date,0,8) from balances where client_id=#{params[:client_id]}")
		ml.each do |m|
			@list << m[0]
		end
		respond_with(@list)
	end
end