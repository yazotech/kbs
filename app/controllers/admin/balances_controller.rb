module Admin
  class BalancesController < ResourceController

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
