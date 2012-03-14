class AddProductToChannel < ActiveRecord::Migration
  def change
  	add_column :channels, :product_id, :integer
  end
end
