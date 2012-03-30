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

ActiveRecord::Schema.define(:version => 20120306030441) do

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

  create_table "balances", :force => true do |t|
    t.date     "balance_date"
    t.string   "channel_number"
    t.integer  "count"
    t.integer  "product_id"
    t.integer  "client_id"
    t.integer  "company_id"
    t.integer  "agreement_id"
    t.decimal  "price",          :precision => 8, :scale => 2, :default => 0.0
    t.decimal  "amount",         :precision => 8, :scale => 2, :default => 0.0
    t.string   "remark"
    t.integer  "status"
    t.datetime "created_at",                                                    :null => false
    t.datetime "updated_at",                                                    :null => false
  end

  create_table "books", :force => true do |t|
    t.string   "title"
    t.string   "author"
    t.string   "isbn"
    t.text     "brief"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "channels", :force => true do |t|
    t.integer  "client_id"
    t.string   "channel_number"
    t.integer  "product_id"
    t.string   "remark"
    t.integer  "status",         :default => 0
    t.datetime "created_at",                    :null => false
    t.datetime "updated_at",                    :null => false
  end

  create_table "clients", :force => true do |t|
    t.string   "name"
    t.decimal  "balance",       :precision => 8, :scale => 2, :default => 0.0
    t.datetime "balance_date"
    t.datetime "last_pay_date"
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

  create_table "products", :force => true do |t|
    t.string   "title"
    t.string   "description"
    t.integer  "status",      :default => 0
    t.datetime "created_at",                 :null => false
    t.datetime "updated_at",                 :null => false
  end

  create_table "users", :force => true do |t|
    t.string   "login_name"
    t.integer  "client_id"
    t.integer  "company_id"
    t.string   "email",                  :default => "", :null => false
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

end
