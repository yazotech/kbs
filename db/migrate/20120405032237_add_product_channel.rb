class AddProductChannel < ActiveRecord::Migration
  def change
  	add_column :products, :channel_number, :string
  end

end
