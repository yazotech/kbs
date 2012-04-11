# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20120411050313) do

  create_table "agreements", :force => true do |t|
    t.integer  "company_id"
    t.integer  "client_id"
    t.integer  "product_id"
    t.date     "agreement_start"
    t.date     "agreement_end"
    t.date     "agreement_sign"
    t.decimal  "price",           :precision => 8, :scale => 2, :default => 0.0
    t.integer  "status",                                        :default => 0
    t.datetime "created_at",                                                     :null => false
    t.datetime "updated_at",                                                     :null => false
  end

  add_index "agreements", ["agreement_end"], :name => "index_agreements_on_agreement_end"
  add_index "agreements", ["agreement_sign"], :name => "index_agreements_on_agreement_sign"
  add_index "agreements", ["client_id"], :name => "index_agreements_on_client_id"
  add_index "agreements", ["product_id"], :name => "index_agreements_on_product_id"

  create_table "balances", :force => true do |t|
    t.date     "balance_date"
    t.string   "channel_number"
    t.integer  "count"
    t.integer  "channel_id"
    t.integer  "product_id"
    t.integer  "client_id"
    t.integer  "company_id"
    t.integer  "agreement_id"
    t.decimal  "price",          :precision => 8, :scale => 2, :default => 0.0
    t.decimal  "amount",         :precision => 8, :scale => 2, :default => 0.0
    t.decimal  "product_price",  :precision => 8, :scale => 2, :default => 0.0
    t.decimal  "product_amount", :precision => 8, :scale => 2, :default => 0.0
    t.string   "remark"
    t.integer  "status"
    t.integer  "publish_status"
    t.datetime "created_at",                                                    :null => false
    t.datetime "updated_at",                                                    :null => false
  end

  add_index "balances", ["agreement_id"], :name => "index_balances_on_agreement_id"
  add_index "balances", ["channel_id"], :name => "index_balances_on_channel_id"
  add_index "balances", ["client_id"], :name => "index_balances_on_client_id"
  add_index "balances", ["company_id"], :name => "index_balances_on_company_id"
  add_index "balances", ["product_id"], :name => "index_balances_on_product_id"

  create_table "channels", :force => true do |t|
    t.integer  "client_id"
    t.string   "channel_number"
    t.integer  "product_id"
    t.string   "remark"
    t.integer  "status",         :default => 0
    t.datetime "created_at",                    :null => false
    t.datetime "updated_at",                    :null => false
  end

  add_index "channels", ["channel_number"], :name => "index_channels_on_channel_number", :unique => true
  add_index "channels", ["client_id"], :name => "index_channels_on_client_id"
  add_index "channels", ["product_id"], :name => "index_channels_on_product_id"

  create_table "clients", :force => true do |t|
    t.string   "name"
    t.string   "tel"
    t.string   "remark"
    t.decimal  "balance",       :precision => 8, :scale => 2, :default => 0.0
    t.date     "balance_date"
    t.date     "last_pay_date"
    t.datetime "last_login"
    t.datetime "created_at",                                                   :null => false
    t.datetime "updated_at",                                                   :null => false
  end

  create_table "companies", :force => true do |t|
    t.string   "title"
    t.string   "description"
    t.integer  "status"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "emps", :force => true do |t|
    t.string   "login_name"
    t.string   "email"
    t.string   "encrypted_password",     :default => "", :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "password_salt"
    t.integer  "failed_attempts",        :default => 0
    t.string   "unlock_token"
    t.datetime "locked_at"
    t.string   "authentication_token"
    t.datetime "created_at",                             :null => false
    t.datetime "updated_at",                             :null => false
  end

  add_index "emps", ["authentication_token"], :name => "index_emps_on_authentication_token", :unique => true
  add_index "emps", ["login_name"], :name => "index_emps_on_login_name", :unique => true
  add_index "emps", ["reset_password_token"], :name => "index_emps_on_reset_password_token", :unique => true
  add_index "emps", ["unlock_token"], :name => "index_emps_on_unlock_token", :unique => true

  create_table "products", :force => true do |t|
    t.string   "title"
    t.string   "channel_number"
    t.decimal  "price",          :precision => 8, :scale => 2, :default => 0.0
    t.string   "description"
    t.integer  "status",                                       :default => 0
    t.datetime "created_at",                                                    :null => false
    t.datetime "updated_at",                                                    :null => false
  end

  add_index "products", ["channel_number"], :name => "index_products_on_channel_number"

  create_table "user_infos", :force => true do |t|
    t.integer  "user_id"
    t.string   "real_name"
    t.string   "website"
    t.string   "phone"
    t.string   "remark"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "user_infos", ["user_id"], :name => "index_user_infos_on_user_id", :unique => true

  create_table "users", :force => true do |t|
    t.string   "login_name"
    t.integer  "client_id"
    t.string   "email"
    t.string   "encrypted_password",     :default => "", :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                             :null => false
    t.datetime "updated_at",                             :null => false
  end

  add_index "users", ["login_name"], :name => "index_users_on_login_name", :unique => true

end
