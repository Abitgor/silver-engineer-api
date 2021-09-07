class CreateContracts < ActiveRecord::Migration[6.1]
  def change
    create_table :contracts do |t|
      t.references :author , index: true, foreign_key: {to_table: :users,on_delete: :cascade}, null: false
      t.references :signer , index: true, foreign_key: {to_table: :users,on_delete: :cascade}
      t.references :job, foreign_key: { on_delete: :cascade }, null: false
      t.integer :rate
      t.integer :hours
      t.integer :status
      t.timestamps
    end
  end
end
