class TrigramIndexOnWords < ActiveRecord::Migration
  def up
    execute "CREATE INDEX words_trigrams ON words USING gist (content gist_trgm_ops);"
  end

  def down
    execute "DROP INDEX words_trigrams;"
  end
end
