class FixTextsColumn < ActiveRecord::Migration
  def change
    change_column :translations, :content, :text
  end
end
