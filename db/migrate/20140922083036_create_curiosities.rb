class CreateCuriosities < ActiveRecord::Migration
  def change
    create_table :curiosities do |t|
      t.references :user, index: true
      t.string :title
      t.text :description
      t.boolean :shared

      t.timestamps
    end
  end
end
