class CreateIssues < ActiveRecord::Migration[8.0]
  def change
    create_table :issues do |t|
      t.references :user, null: false, foreign_key: true
      t.integer :frequency
      t.string :address
      t.string :title
      t.text :description

      t.timestamps
    end
  end
end
