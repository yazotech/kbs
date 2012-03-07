class CreateChannels < ActiveRecord::Migration
  def change
    create_table :channels do |t|
      t.integer :company_id
      t.string :channel_number
      t.string :title
      t.string :description
      t.integer :status

      t.timestamps
    end
  end
end
