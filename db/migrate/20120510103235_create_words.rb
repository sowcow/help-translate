class CreateWords < ActiveRecord::Migration
  def change
    create_table :words do |t|
      t.integer :text_id
      t.string :content

      t.timestamps
    end
  end
end
