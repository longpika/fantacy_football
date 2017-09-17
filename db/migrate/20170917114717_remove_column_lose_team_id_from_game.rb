class RemoveColumnLoseTeamIdFromGame < ActiveRecord::Migration[5.1]
  def change
    remove_column :games, :loser_team_id, :integer
  end
end
