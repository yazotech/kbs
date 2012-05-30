module Admin
  class BalancesController < ResourceController

      def load_collection
        params[:search] ||= {}
        @search = Balance.history.metasearch(params[:search])
        @collection = @search.page(params[:page]).per_page(20)
      end 

      def month_seach
        month = params[:month]
        if month
          @collection = Balance.where(:client_id => client_id).where(["balance_date like ?", month + '% order by balance_date desc'])
        else
          @collection = []
        end
        render 'index.html.erb'
      end

  end
end
