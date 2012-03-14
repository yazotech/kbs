module Admin
  class ImportsController < AdminController
  	def index
  	  @balances = Balance.where('status=0')
  	end

def save
   Balance.where('status=0').each do |b|
          ch = Channel.find_by_id(b.channel_number)
          if ch
            b.company_id= ch.company_id
            b.status = 1
            b.save!
          end
        end
    redirect_to :action => :index, :controller => :imports
end

def clear
  Balance.where('status=0').delete_all
  redirect_to :action => :index, :controller => :imports
end


    def show
      if params[:op] == 'clear'
        Balance.where('status=0').delete_all
      elsif params[:op] == 'import'
        data = params[:import_text]
        lines = data.split(/\n/)
        lines.each do |line|
          cs = line.split(/[\t\s]/)
          if cs.length>2
            b = Balance.new
            b.product_id = 1
            b.balance_date = cs[0]
            b.channel_number = cs[1]
            b.count = cs[2]
            b.status = 0
            b.save!
          end
        end
      elsif params[:op] == 'save'
        Balance.where('status=0').each do |b|
          ch = Channel.find_by_id(b.channel_number)
          if ch
            b.company_id = ch.company_id
            b.status = 1
            b.save!
          end
        end
      end
      redirect_to :action => :index, :controller => :imports
    end
  end
end