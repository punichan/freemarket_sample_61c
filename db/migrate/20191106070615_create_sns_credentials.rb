class CreateSnsCredentials < ActiveRecord::Migration[5.2]
  def change
    create_table :sns_credentials do |t|
      t.string :provider
      t.string :uid
      t.integer :user_id, null: false, foreign_key: true
      t.timestamps
    end
  end
end
