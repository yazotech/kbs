module Admin
  class ImportsController < AdminController
  	def index
     @balances = Balance.new_input
    end
    def check_data
      Balance.new_input.each do |b|
        ch = Channel.where(:channel_number => b.channel_number).first
        if ch
          b.channel_id = ch.id
          b.product_id = ch.product_id
          b.client_id = ch.client_id
          b.price = b.amount = b.product_price = b.product_amount = 0
          b.status = 0

          if b.channel_id && b.channel_id > 0 && b.product_id && b.product_id > 0 && b.client_id && b.client_id > 0
            if b.dz_count > 0
              pd = Product.find(b.product_id)
              b.product_price = pd.price
              b.product_amount = pd.price * b.dz_count
              b.status = 1
              if b.count && b.count > 0
                agr = Agreement.where(['client_id=? and product_id=? and agreement_start<=? and agreement_end>=?', ch.client_id, ch.product_id, b.balance_date, b.balance_date]).first
                if agr
                  b.company_id = agr.company_id
                  b.agreement_id = agr.id
                  b.price = agr.price
                  b.amount = b.count * b.price
                else
                  b.status = 0
                end
              end
            end
          end

          b.save
        end
      end
      flash[:notice] = '已检查并填写客户、产品和价格等字段，请检查。'
      redirect_to :action => :index
    end


 def sjfloat
       @date = Balance.find_by_sql('select sum(count) as count, balance_date from balances group by balance_date')
       render 'sjflot.html.erb'
 end


  def save
    Balance.new_input.where('company_id is not null and company_id > 0 and status=1').update_all(:status => 10)
    redirect_to :action => :index
  end

def clear
  Balance.where('status=0').delete_all
  redirect_to :action => :index, :controller => :imports
end

    def save_data
      Balance.new_input.where(:status => 1).update_all(:status => 10)
      flash[:notice] = '数据保存成功。'
      redirect_to :action => :index
    end


    def clear_data
      Balance.new_input.delete_all
      flash[:notice] = '数据已清空，请重新导入。'
      redirect_to :action => :index
    end

    def create
      data = params[:import_text]
      lines = data.split(/\n/)
      lines.each do |line|
        cs = line.split(/[\t\s]/)
        if cs.length>2
          b = Balance.new
          b.balance_date = cs[0]
          b.channel_number = cs[1]
          
          b.dz_count = cs[3] if cs.length>3
          b.status = 0
          b.dz_count = b.count if !b.dz_count || b.dz_count<1
          b.save!
        end
      end
      flash[:notice] = "导入数据#{lines.count}行。" if lines
      redirect_to :action => :index
    end

  end
end
