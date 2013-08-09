class AddRankCityDescriptionToUsers < ActiveRecord::Migration
  def change
    add_column :users, :rank, :string
    add_column :users, :city, :string
    add_column :users, :description, :text
  end
end
