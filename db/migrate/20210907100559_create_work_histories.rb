class CreateWorkHistories < ActiveRecord::Migration[6.1]
  def change
    create_table :work_histories do |t|
      t.references :author , index: true, foreign_key: {to_table: :users, on_delete: :cascade}, null: false
      t.references :signer , index: true, foreign_key: {to_table: :users, on_delete: :cascade}
      t.references :contracts, foreign_key: { on_delete: :cascade }, null: false
      t.integer :rate
      t.integer :hours
      t.datetime :start_date
      t.datetime :end_date
      t.string :title
      t.text :description
      t.string :job_type
      t.integer :price
      t.timestamps
    end
  end
end
