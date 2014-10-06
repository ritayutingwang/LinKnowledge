class AddInfoToUsers < ActiveRecord::Migration
  def change
    add_column :users, :first_name, :string
    add_column :users, :last_name, :string
    add_column :users, :nickname, :string
    add_column :users, :facebook_profile, :string
    add_column :users, :usingFbProfile, :boolean, default: true
  end
end
