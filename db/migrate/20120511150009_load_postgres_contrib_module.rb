class LoadPostgresContribModule < ActiveRecord::Migration
  def up
    puts '11111111111111111111111111'
    execute 'CREATE EXTENSION pg_trgm;'
  end
  def down
    execute 'DROP EXTENSION pg_trgm;'
  end
end
