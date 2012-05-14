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
         @company=[]
         @c = Company.all
         @c.each do |c|
           @company << c.title
         end
         @client=[]
         @c1 = Client.all
         @c1.each do |c1|
           @client << c1.name
         end
         @product=[]
         @c2 = Product.all
         @c2.each do |c2|
           @product << c2.title
         end
    end
    end
end
