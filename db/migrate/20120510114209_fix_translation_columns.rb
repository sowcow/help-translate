class FixTranslationColumns < ActiveRecord::Migration
  def change
    rename_column :translations, :sentence_id, :word_id
    rename_column :translations, :body, :content
  end
end
