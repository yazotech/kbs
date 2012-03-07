class CreateCompanies < ActiveRecord::Migration
  def change
    create_table :companies do |t|
      t.string :name
      t.decimal :balance
      t.datetime :balance_date
      t.datetime :pay_date

      t.timestamps
    end
  end
end
