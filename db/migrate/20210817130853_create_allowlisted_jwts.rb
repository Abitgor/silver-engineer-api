class CreateAllowlistedJwts < ActiveRecord::Migration[6.1]
  def change
    create_table :allowlisted_jwts do |t|
      t.string :jti
      t.string :aud
      t.datetime :exp
      t.references :user, foreign_key: { on_delete: :cascade }, null: false

      t.timestamps
    end
    add_index :allowlisted_jwts, :jti
  end
end
