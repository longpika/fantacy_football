class Match < ApplicationRecord
  has_many :games, dependent: :destroy
  has_many :team_in_games, dependent: :destroy
  has_many :teams, through: :team_in_games
  belongs_to :winner_team, class_name: 'Team',
    foreign_key: :winner_team_id, optional: true

  after_update :updating_match_result_and_team_ranking

  accepts_nested_attributes_for :games, :team_in_games, allow_destroy: true


  validate do
    check_game_number
  end

  private

  def check_game_number
    number = games.length
    error_string = 'One match should has at most 3 games and at least 2 games'
    errors[:base] << error_string unless number.between?(2,3)
  end

  def updating_match_result_and_team_ranking
    matches = Match.joins(:games, :team_in_games)
    match = matches.find_by_id(self.id)
    return unless match
    teams = match.teams.uniq
    return if teams.length != 2
    games = match.games.where.not(winner_team_id: nil)
    total_played_games = games.length
    return if total_played_games < 2
    team_ids = games.pluck(:winner_team_id)
    first_team_id = team_ids[0]
    team_ids.count(first_team_id) >= 2 ?
      flag = match.update_attribute(:winner_team_id, first_team_id) :
        flag = match.update_attribute(:winner_team_id, team_ids[1])
    errors[:base] << "Errors Appears" unless flag
    teams.each do |team|
      total_win_matches = Match.where(winner_team_id: team.id).length
      total_played_matches = Team.find_by_id(team.id).matches.uniq.length
      ranking = ((total_win_matches.to_f / total_played_matches.to_f) * 100.0)
      team.update_attribute(:ranking, ranking)
    end
  end

  # def check_team_number
  #   number = teams.length
  #   p '============================================================='
  #   p number
  #   error_string = 'One match should has 2 teams'
  #   errors[:base] << error_string if number > 2
  # end
end
