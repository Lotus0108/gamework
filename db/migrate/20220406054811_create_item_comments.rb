class CreateItemComments < ActiveRecord::Migration[6.1]
  def change
    create_table :item_comments do |t|
      t.integer :publics_id, null: false
      t.integer :items_id, null: false
      t.text :comments, null: false

      t.timestamps
    end
  end
end
