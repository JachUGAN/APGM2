class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :first_name
      t.string :last_name
      t.string :username
      t.string :email
      t.string :role
      t.string :password_digest
      t.string :remember_token
      t.string :rank
      t.string :city
      t.text :description

      t.timestamps
    end
  end
end