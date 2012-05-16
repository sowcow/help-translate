class M2mTextsWords < ActiveRecord::Migration
  def change
    create_table :texts_words, id: false do |t|
      t.integer :text_id
      t.integer :word_id
    end
  end
end
