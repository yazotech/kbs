class AddCountToBalance < ActiveRecord::Migration
  def change
  	add_column :balances, :dz_count, :integer
  end
end
