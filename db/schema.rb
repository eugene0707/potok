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
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20161010185756) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "users", force: :cascade, comment: "Пользователи" do |t|
    t.string   "email",                  :default=>"", :null=>false, :index=>{:name=>"index_users_on_email", :unique=>true}
    t.string   "encrypted_password",     :default=>"", :null=>false
    t.string   "reset_password_token",   :index=>{:name=>"index_users_on_reset_password_token", :unique=>true}
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          :default=>0, :null=>false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at",             :null=>false
    t.datetime "updated_at",             :null=>false
    t.string   "name"
    t.integer  "role",                   :comment=>"Роль пользователя"
  end

  create_table "investments", force: :cascade, comment: "Инвестиционные пакеты" do |t|
    t.integer  "user_id",       :null=>false, :comment=>"Инвестор", :index=>{:name=>"fk__investments_user_id"}, :foreign_key=>{:references=>"users", :name=>"fk_investments_user_id", :on_update=>:no_action, :on_delete=>:no_action}
    t.string   "name",          :null=>false
    t.integer  "term",          :null=>false, :comment=>"Срок инвестиций"
    t.decimal  "interest_rate", :precision=>5, :scale=>4, :default=>0.5, :null=>false, :comment=>"Ожидаемый доход"
    t.datetime "created_at",    :null=>false
    t.datetime "updated_at",    :null=>false
  end

  create_table "loans", force: :cascade, comment: "Выданные кредиты" do |t|
    t.integer  "user_id",       :null=>false, :comment=>"Получатель займа", :index=>{:name=>"fk__loans_user_id"}, :foreign_key=>{:references=>"users", :name=>"fk_loans_user_id", :on_update=>:no_action, :on_delete=>:no_action}
    t.integer  "investment_id", :null=>false, :comment=>"Источник финансирования", :index=>{:name=>"fk__loans_investment_id"}, :foreign_key=>{:references=>"investments", :name=>"fk_loans_investment_id", :on_update=>:no_action, :on_delete=>:no_action}
    t.integer  "amount",        :null=>false, :comment=>"Сумма займа"
    t.integer  "term",          :null=>false, :comment=>"Срок займа"
    t.decimal  "interest_rate", :precision=>5, :scale=>4, :default=>0.5, :null=>false, :comment=>"Ставка по кредиту"
    t.decimal  "penalty_rate",  :precision=>5, :scale=>4, :default=>0.5, :null=>false, :comment=>"Штраф за задержку платежа"
    t.datetime "created_at",    :null=>false
    t.datetime "updated_at",    :null=>false
  end

  create_table "loan_payments", force: :cascade, comment: "Платежи по кредитам" do |t|
    t.integer  "loan_id",    :null=>false, :index=>{:name=>"fk__loan_payments_loan_id"}, :foreign_key=>{:references=>"loans", :name=>"fk_loan_payments_loan_id", :on_update=>:no_action, :on_delete=>:no_action}
    t.decimal  "amount",     :precision=>15, :scale=>2, :null=>false, :comment=>"Сумма платежа"
    t.integer  "period",     :null=>false, :comment=>"Период платежа"
    t.boolean  "is_overdue", :default=>false, :null=>false, :comment=>"Флаг просроченного платежа"
    t.datetime "created_at", :null=>false
    t.datetime "updated_at", :null=>false
  end

end
