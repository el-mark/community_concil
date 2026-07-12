class CreateUsers < ActiveRecord::Migration[8.0]
  def change
    create_table :users do |t|
      t.string :email
      t.string :verification_token
      t.datetime :verified_at

      t.timestamps
    end
    add_index :users, :email, unique: true
    add_index :users, :verification_token, unique: true
  end
end
