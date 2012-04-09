module Admin
  class BalancesController < ResourceController
  	protected
      def load_collection
        params[:search] ||= {}
        @search = Balance.history.metasearch(params[:search])
        @collection = @search.page(params[:page]).per_page(AppConfig[:admin_list_per_page])
      end
  end
end
