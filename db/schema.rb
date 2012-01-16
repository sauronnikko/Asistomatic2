# encoding: UTF-8
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

ActiveRecord::Schema.define(:version => 20120116002101) do

  create_table "absence_schedule_blocks", :force => true do |t|
    t.integer  "absence_id",        :default => 0
    t.integer  "schedule_block_id", :default => 0, :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "absences", :force => true do |t|
    t.string   "description"
    t.integer  "employee_id",  :default => 0, :null => false
    t.integer  "work_date_id", :default => 0, :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "employees", :force => true do |t|
    t.string   "first_name",      :default => "", :null => false
    t.string   "first_last_name", :default => "", :null => false
    t.string   "unique_id",       :default => "", :null => false
    t.string   "employee_type"
    t.date     "date_of_birth"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "employees", ["unique_id"], :name => "index_employees_on_unique_id", :unique => true

  create_table "justifications", :force => true do |t|
    t.string   "description",  :default => "",    :null => false
    t.boolean  "is_justified", :default => false, :null => false
    t.integer  "absence_id",   :default => 0,     :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "justifications", ["absence_id"], :name => "index_justifications_on_absence_id", :unique => true

  create_table "periods", :force => true do |t|
    t.string   "name",       :default => "",           :null => false
    t.string   "code"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.date     "start_date", :default => '2011-11-20', :null => false
    t.date     "end_date",   :default => '2012-02-20', :null => false
  end

  add_index "periods", ["end_date"], :name => "index_periods_on_end_date", :unique => true
  add_index "periods", ["name"], :name => "index_periods_on_name", :unique => true
  add_index "periods", ["start_date"], :name => "index_periods_on_start_date", :unique => true

  create_table "schedule_blocks", :force => true do |t|
    t.time     "start_time",  :default => '2000-01-01 21:24:34', :null => false
    t.time     "end_time",    :default => '2000-01-01 22:24:34', :null => false
    t.integer  "schedule_id", :default => 0
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "schedule_blocks", ["schedule_id", "end_time"], :name => "index_schedule_blocks_on_schedule_id_and_end_time", :unique => true
  add_index "schedule_blocks", ["schedule_id", "start_time"], :name => "index_schedule_blocks_on_schedule_id_and_start_time", :unique => true

  create_table "schedules", :force => true do |t|
    t.string   "name",       :default => "", :null => false
    t.string   "code"
    t.integer  "period_id",  :default => 0,  :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "schedules", ["period_id", "name"], :name => "index_schedules_on_period_id_and_name", :unique => true

  create_table "users", :force => true do |t|
    t.string   "email",                                 :default => "", :null => false
    t.string   "encrypted_password",     :limit => 128, :default => "", :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",                         :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "username",                                              :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true
  add_index "users", ["username"], :name => "index_users_on_username", :unique => true

  create_table "work_dates", :force => true do |t|
    t.date     "work_date",  :default => '2011-11-19', :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "period_id",  :default => 0,            :null => false
  end

  add_index "work_dates", ["work_date"], :name => "index_work_dates_on_work_date", :unique => true

end
