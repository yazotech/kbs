module Admin
  class ImportsController < AdminController
  	def index
     @balances = Balance.new_input
    end
  def checkdate
    Balance.new_input.each do |b|
      ch = Channel.where(:channel_number => b.channel_number).first
      if ch
        b.channel_id = ch.id
        b.product_id = ch.product_id
        b.client_id = ch.client_id

        if b.channel_id && b.channel_id > 0 && b.product_id && b.product_id > 0 && b.client_id && b.client_id > 0
          agr = Agreement.where(['client_id=? and product_id=? and agreement_start<=? and agreement_end>=?', ch.client_id, ch.product_id, b.balance_date, b.balance_date]).first
          if agr
            b.company_id = agr.company_id
            b.agreement_id = agr.id
            b.price = agr.price
            b.amount = b.count * b.price
            b.status = 1
          end
        end

        b.save
      end
    end
    redirect_to :action => :index, :controller => :imports
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