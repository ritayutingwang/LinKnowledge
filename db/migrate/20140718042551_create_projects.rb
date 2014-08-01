class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|
      t.references :user, index: true
      t.string :name
      t.text :description
      t.string :city
      t.datetime :class_datetime
      t.integer :capacity, default: 12
      t.integer :duration, default: 12
      t.string :status, default: 'open'
      t.float :minimum_backing_value, default: 12
      t.float :total_value

      t.timestamps
    end
  end
end
