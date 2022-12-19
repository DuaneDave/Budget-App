# frozen_string_literal: true

# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.0].define(version: 20_221_218_932_033) do
  # These are extensions that must be enabled in order to support this database
  enable_extension 'plpgsql'

  create_table 'entities', force: :cascade do |t|
    t.string 'name'
    t.integer 'amount'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
  end

  create_table 'groups', force: :cascade do |t|
    t.string 'name'
    t.string 'icon'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.bigint 'user_id', null: false
    t.integer 'total_amount', default: 0
    t.index ['user_id'], name: 'index_groups_on_user_id'
  end

  create_table 'money_groups', force: :cascade do |t|
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.bigint 'group_id', null: false
    t.bigint 'operation_id', null: false
    t.index ['group_id'], name: 'index_money_groups_on_group_id'
    t.index ['operation_id'], name: 'index_money_groups_on_operation_id'
  end

  create_table 'operations', force: :cascade do |t|
    t.string 'name'
    t.integer 'amount'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.bigint 'user_id', null: false
    t.index ['user_id'], name: 'index_operations_on_user_id'
  end

  create_table 'users', force: :cascade do |t|
    t.string 'name'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
  end

  add_foreign_key 'groups', 'users'
  add_foreign_key 'money_groups', 'groups'
  add_foreign_key 'money_groups', 'operations'
  add_foreign_key 'operations', 'users'
end
