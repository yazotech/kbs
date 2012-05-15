module Admin
	class AgreementsController < ResourceController
	def edit
		 loadselect
      load_object
      invoke_callbacks(:edit, :after)
      render 'admin/shared/edit'
    end
    def new
    	 loadselect
      @object = object_name.classify.constantize.new
      invoke_callbacks(:new_action, :after)
      render 'admin/shared/new'
    end

    protected
    def loadselect
         @c = Company.all
         
         @c1 = Client.all
         
         @c2 = Product.all
   
    end
    end
end
