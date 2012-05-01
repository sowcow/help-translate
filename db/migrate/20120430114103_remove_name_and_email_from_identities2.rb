class RemoveNameAndEmailFromIdentities2 < ActiveRecord::Migration
  def change
    remove_column :identities, :email
    remove_column :identities, :name
  end
end
