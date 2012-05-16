class TranslationsPoly < ActiveRecord::Migration
  def change
    add_column :translations, :translator_type, :string
  end
end
