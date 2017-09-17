class CreateTeamInGames < ActiveRecord::Migration[5.1]
  def change
    create_table :team_in_games do |t|
      t.integer :team_id
      t.integer :game_id

      t.timestamps
    end
  end
end
