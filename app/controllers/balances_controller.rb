class BalancesController < ApplicationController
	def index
		@client = Client.find(params[:cid])
		@balances = @client.balances
	end
end