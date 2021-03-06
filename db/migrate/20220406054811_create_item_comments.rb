class CreateItemComments < ActiveRecord::Migration[6.1]
  def change
    create_table :item_comments do |t|
      t.integer :public_id, null: false
      t.integer :item_id, null: false
      t.text :comment, null: false

      t.timestamps
    end
  end
end
