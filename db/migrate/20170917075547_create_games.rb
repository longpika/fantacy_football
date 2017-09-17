class CreateGames < ActiveRecord::Migration[5.1]
  def change
    create_table :games do |t|
      t.string :name
      t.integer :winner_team_id
      t.integer :loser_team_id
      t.integer :match_id
      t.integer :score

      t.timestamps
    end
  end
end
