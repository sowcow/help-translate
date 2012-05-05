class CreateSentences < ActiveRecord::Migration
  def change
    create_table :sentences do |t|
      t.integer :document_id
      t.string :body
      t.text :additional

      t.timestamps
    end
  end
end
