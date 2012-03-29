class CreateBalances < ActiveRecord::Migration
  def change
  	create_table :balances do |t|
    	t.date :balance_date
        t.string :channel_number
        t.integer :count
    	t.integer :product_id
    	t.integer :company_id
        t.integer :sub_company_id
        t.integer :agreement_id
    	t.decimal :price, :precision => 8, :scale => 2, :default => 0
    	t.decimal :amount, :precision => 8, :scale =>2, :default => 0
    	t.string :remark
    	t.integer :status
    	t.timestamps
    end
 
   create_table :companies do |t|
    	t.string :name
    	t.decimal :balance, :precision => 8, :scale => 2, :default => 0
    	t.datetime :balance_date
    	t.datetime :last_pay_date
    	t.timestamps
    end        

    create_table :channels do |t|
    	t.integer :company_id
    	t.string :channel_number
    	t.string :title
    	t.string :description
    	t.integer :status, :default => 0
  	 	t.timestamps
    end

    create_table :products do |t|
    	t.string :title
    	t.string :description
    	t.integer :status, :default => 0
    	t.timestamps
    end

    create_table :agreements do |t|
        t.integer :sub_company_id
        t.integer :company_id
        t.integer :product_id
        t.date    :agreement_start
        t.date    :agreement_end
        t.date    :agreement_sign
        t.integer :status, :default => 0
        t.timestamps
    end

  end
end
