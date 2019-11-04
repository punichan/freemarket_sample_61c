class ChangeDataBirthYearOnToUsers < ActiveRecord::Migration[5.2]
  def change
    change_column :users, :birth_year_on, :integer
    change_column :users, :birth_month_on, :integer
    change_column :users, :birth_day_on, :integer
  end
end
