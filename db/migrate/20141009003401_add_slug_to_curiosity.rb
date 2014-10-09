class AddSlugToCuriosity < ActiveRecord::Migration
  def change
    add_column :curiosities, :slug, :string
    add_index :curiosities, :slug, unique: true
  end
end
