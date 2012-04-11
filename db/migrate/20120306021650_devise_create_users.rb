class DeviseCreateUsers < ActiveRecord::Migration
  def change
    create_table(:users) do |t|
      ## Database authenticatable
      t.string :login_name
      t.integer :client_id
      t.string :email
      t.string :encrypted_password, :null => false, :default => ""

      ## Recoverable
      t.string   :reset_password_token
      t.datetime :reset_password_sent_at

      ## Rememberable
      t.datetime :remember_created_at

      ## Trackable
      t.integer  :sign_in_count, :default => 0
      t.datetime :current_sign_in_at
      t.datetime :last_sign_in_at
      t.string   :current_sign_in_ip
      t.string   :last_sign_in_ip

      ## Lockable
      #t.integer  :failed_attempts, :default => 0 # Only if lock strategy is :failed_attempts
      #t.string   :unlock_token # Only if unlock strategy is :email or :both
      #t.datetime :locked_at

      t.timestamps
    end

    add_index :users, :login_name,    :unique => true
    # add_index :users, :reset_password_token, :unique => true
    # add_index :users, :confirmation_token,   :unique => true
    # add_index :users, :unlock_token,         :unique => true
    # add_index :users, :authentication_token, :unique => true

  end

end
