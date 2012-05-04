module Admin
  class BalancesController < ResourceController
  	protected

  	index.after :balance_by_date
    show.after :balance_by_date

  	def balance_by_date
      @list = []
          ml = ActiveRecord::Base.connection.execute("select  distinct substr(balance_date,1,7) from balances order by balance_date")
          ml.each do |m|
            @list << [m[0],m[0]]
          end
  		@object = Balance.order('balance_date desc')
  	end

      def load_collection
        params[:search] ||= {}
        @search = Balance.history.metasearch(params[:search])
        @collection = @search.page(params[:page]).per_page(AppConfig[:admin_list_per_page])
      end


      def month_seach
        month = params[:month]
        if month
          @collection = Balance.where(:client_id => client_id).where(["balance_date like ?", month + '%'])
        else
          @collection = []
        end
        render 'index.html.erb'
      end

  end
end
