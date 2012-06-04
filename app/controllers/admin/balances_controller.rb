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

  def balabyclient
    
    if params[:date]
            if params[:date1]
        sql = %Q[
        select * from balances where client_id='#{params[:id]}' and balance_date between '#{params[:date]}' and '#{params[:date1]}' order by balance_date desc]
            end
             else
      sql = %Q[
          select * from balances where client_id='#{params[:id]}' order by balance_date desc]       
      end
             @collection = Balance.find_by_sql(sql)
        render 'balabyclient.html.erb'
    end
    
  end
end
