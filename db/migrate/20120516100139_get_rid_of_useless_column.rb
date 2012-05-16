class GetRidOfUselessColumn < ActiveRecord::Migration
  def up
    remove_column :texts, :type
  end
end
