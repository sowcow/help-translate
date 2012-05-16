class CreateTranslations < ActiveRecord::Migration
  def change
    create_table :translations do |t|
      t.text :content
      t.integer :word_id
      t.integer :translator_id

      t.timestamps
    end
  end
end
