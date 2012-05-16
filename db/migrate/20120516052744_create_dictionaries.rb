class CreateDictionaries < ActiveRecord::Migration
  def change
    create_table :dictionaries do |t|
      t.string :title
      t.text :content
      t.text :descriptin
      t.integer :user_id

      t.timestamps
    end
  end
end
