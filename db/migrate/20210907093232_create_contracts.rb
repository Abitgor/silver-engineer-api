class CreateContracts < ActiveRecord::Migration[6.1]
  def change
    create_table :contracts do |t|
      t.references :author , index: true, foreign_key: {to_table: :users,on_delete: :cascade}, null: false
      t.references :signer , index: true, foreign_key: {to_table: :users,on_delete: :cascade}
      t.references :job, foreign_key: { on_delete: :cascade }, null: false
      t.integer :rate, default: 0
      t.integer :hours, default: 0
      t.integer :status, default: 0
      t.timestamps
    end
  end
end
