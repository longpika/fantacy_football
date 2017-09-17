class Game < ApplicationRecord
  belongs_to :match
  belongs_to :winner_team, class_name: 'Team', optional: true
  belongs_to :loser_team, class_name: 'Team', optional: true
  has_many :team_in_games, dependent: :destroy

end
