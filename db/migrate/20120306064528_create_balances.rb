class CreateBalances < ActiveRecord::Migration
  def change
    create_table :balances do |t|
      t.datetime :balance_date
      t.integer :product_id
      t.string :channel_number
      t.integer :company_id
      t.decimal :price
      t.integer :count
      t.decimal :amount
      t.string :remark
      t.integer :status

      t.timestamps
    end
  end
end
