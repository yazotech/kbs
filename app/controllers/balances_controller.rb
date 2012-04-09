class BalancesController < ApplicationController
	before_filter :authenticate_user!
	def index
		#debugger
		@client = Client.find(current_user.client_id)
		@balances = @client.balances
	end
end