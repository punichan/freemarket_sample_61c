class AddColumn1ToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :nickname, :string, null: false
    add_column :users, :first_name, :string, null: false
    add_column :users, :last_name, :string, null: false
    add_column :users, :first_name_kana, :string, null: false
    add_column :users, :last_name_kana, :string, null: false
    add_column :users, :phone_number, :integer, null: false, unique: true
    add_column :users, :birth_year_on, :date, null: false
    add_column :users, :birth_month_on, :date, null: false
    add_column :users, :birth_day_on, :date, null: false
    add_column :users, :profile, :text
    add_column :users, :point, :integer, null: false
    add_column :users, :avatar, :string
  end
end
