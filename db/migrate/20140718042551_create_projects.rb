class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|
      t.references :user, index: true
      t.string :name
      t.text :description
      t.date :due_day
      t.date :init_day
      t.float :target_price, default: 10000
      t.string :status, default: 'open'
      t.float :amount

      t.timestamps
    end
  end
end
