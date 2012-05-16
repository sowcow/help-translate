class DropTranslations < ActiveRecord::Migration
  def up
    drop_table :translations
  end
end
