module Admin
	class CompaniesController < AdminController
		def index
			render :text => 'companies'
		end
	end
end