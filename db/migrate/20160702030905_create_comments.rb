class CreateComments < ActiveRecord::Migration[5.0]
  def change
    create_table :comments do |t|
      t.text :content
      t.references :user, foreign_key: true
      t.integer :parent_id, index: true, default: 0

      t.timestamps
    end
  end
end
