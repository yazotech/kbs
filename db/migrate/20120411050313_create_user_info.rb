class CreateUserInfo < ActiveRecord::Migration
  def change
    create_table :user_infos do |t|
    	t.integer :user_id
      t.string :real_name
      t.string :website
      t.string :phone
      t.string :remark
      t.timestamps
    end
    add_index :user_infos, :user_id,  :unique => true
  end

end
