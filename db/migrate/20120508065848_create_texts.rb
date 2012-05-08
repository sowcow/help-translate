class CreateTexts < ActiveRecord::Migration
  def change
    create_table :texts do |t|
      t.string :title
      t.text :description
      t.text :content
      t.integer :user_id

      t.timestamps
    end
  end
end
