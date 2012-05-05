class CreateTranslations < ActiveRecord::Migration
  def change
    create_table :translations do |t|
      t.integer :sentence_id
      t.integer :user_id
      t.string :body

      t.timestamps
    end
  end
end
