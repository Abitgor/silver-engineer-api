class CreateJobs < ActiveRecord::Migration[6.1]
  def change
    create_table :jobs do |t|
      t.references :user, foreign_key: { on_delete: :cascade }, null: false
      t.string :title
      t.text :description
      t.integer :status
      t.string :type
      t.integer :price
      t.timestamps
    end
  end
end
