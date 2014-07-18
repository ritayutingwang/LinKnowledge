class CreateBackings < ActiveRecord::Migration
  def change
    create_table :backings do |t|
      t.references :project, index: true
      t.references :user, index: true
      t.float :amount
      t.string :reward

      t.timestamps
    end
  end
end
