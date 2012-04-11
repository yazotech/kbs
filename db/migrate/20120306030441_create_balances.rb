class CreateBalances < ActiveRecord::Migration
  def change
    create_table :companies do |t|
        t.string :title
        t.string :description
        t.integer :status
        t.timestamps
    end

  	create_table :balances do |t|
    	t.date :balance_date
        t.string :channel_number
        t.integer :count
        t.integer :channel_id
    	t.integer :product_id
    	t.integer :client_id
        t.integer :company_id
        t.integer :agreement_id
    	t.decimal :price, :precision => 8, :scale => 2, :default => 0
    	t.decimal :amount, :precision => 8, :scale =>2, :default => 0
        t.decimal :product_price, :precision => 8, :scale => 2, :default => 0
        t.decimal :product_amount, :precision => 8, :scale =>2, :default => 0
    	t.string :remark
    	t.integer :status
        t.integer :publish_status
    	t.timestamps
    end
    add_index :balances, :channel_id
    add_index :balances, :product_id
    add_index :balances, :client_id
    add_index :balances, :agreement_id
    add_index :balances, :company_id
 
   create_table :clients do |t|
    	t.string :name
        t.string :tel
        t.string :remark
    	t.decimal :balance, :precision => 8, :scale => 2, :default => 0
    	t.date :balance_date
    	t.date :last_pay_date
        t.datetime :last_login
    	t.timestamps
    end        

    create_table :channels do |t|
    	t.integer :client_id
    	t.string :channel_number
    	t.integer :product_id
        t.string :remark
    	t.integer :status, :default => 0
  	 	t.timestamps
    end
    add_index :channels, :channel_number, :unique => true
    add_index :channels, :client_id
    add_index :channels, :product_id

    create_table :products do |t|
    	t.string :title
        t.string :channel_number
        t.decimal :price, :precision => 8, :scale => 2, :default => 0
    	t.string :description
    	t.integer :status, :default => 0
    	t.timestamps
    end
    add_index :products, :channel_number

    create_table :agreements do |t|
        t.integer :company_id
        t.integer :client_id
        t.integer :product_id
        t.date    :agreement_start
        t.date    :agreement_end
        t.date    :agreement_sign
        t.decimal :price, :precision => 8, :scale => 2, :default => 0
        t.integer :status, :default => 0
        t.timestamps
    end
    add_index :agreements, :client_id
    add_index :agreements, :product_id
    add_index :agreements, :agreement_sign
    add_index :agreements, :agreement_end

  end
end
