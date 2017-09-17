class Team < ApplicationRecord
  has_many :team_players, dependent: :destroy
  has_many :players, through: :team_players

  has_many :team_in_games, dependent: :destroy
  has_many :games, through: :team_in_games
  has_many :games, foreign_key: :winner_team_id

  validate do
    check_player_number
    check_duplicate_player
  end

  accepts_nested_attributes_for :team_players, allow_destroy: true

  private

    def check_player_number
      number = team_players.length
      if number > 2
        errors[:base] << 'One team only has two players'
      end
    end

    def check_duplicate_player
      player_ids = team_players.pluck(:id)
    end
end
