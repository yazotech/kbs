module Admin
  class ImportsController < AdminController
  	def index
  	  @balances = Balance.where('status=0')
  	end
    def checkafter
      @balances = Balance.where('status=0')
      render 'checkafter.html.erb'
    end

def checkdate
        bal=Balance.where('status=0')
    if bal != nil
        bal.each do |b|
               ch=Channel.where(:channel_number => b.channel_number)
                if ch != nil
                    ch.each do |c|
                         agr=Agreement.where(:product_id => c.product_id)
                             if agr != nil
                                  agr.each do |a|
                                     b.price = a.price
                                     b.product_id = c.product_id
                                     b.client_id = c.client_id
                                     b.company_id = a.company_id
                                     b.agreement_id = a.id
                                     b.amount = b.count*a.price
                                     b.save!
                                   end
                               end
                    end
               end
        end
      redirect_to :action => :checkafter, :controller => :imports
    end
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