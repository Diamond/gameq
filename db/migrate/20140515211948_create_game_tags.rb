class CreateGameTags < ActiveRecord::Migration
  def change
    create_table :game_tags do |t|
      t.integer :game_id
      t.integer :tag_id
      t.integer :score

      t.timestamps
    end
  end
end
