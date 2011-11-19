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

ActiveRecord::Schema.define(:version => 20111119153613) do

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
    t.string   "name",       :default => "", :null => false
    t.string   "code"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "periods", ["name"], :name => "index_periods_on_name", :unique => true

  create_table "schedules", :force => true do |t|
    t.string   "name",       :default => "", :null => false
    t.string   "code"
    t.integer  "period_id",  :default => 0,  :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "schedules", ["period_id", "name"], :name => "index_schedules_on_period_id_and_name", :unique => true

  create_table "work_dates", :force => true do |t|
    t.date     "work_date",  :default => '2011-11-19', :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "work_dates", ["work_date"], :name => "index_work_dates_on_work_date", :unique => true

end
