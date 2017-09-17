class Match < ApplicationRecord
  has_many :games, dependent: :destroy
  has_one :winner_team, class_name: 'Team', foreign_key: :winner_team_id

  accepts_nested_attributes_for :games, allow_destroy: true

  validate do
    check_game_number
  end

  private

  def check_game_number
    number = games.length
    error_string = 'One match should has at most 3 games and at least 2 games'
    errors[:base] << error_string unless number.between?(2,3)
  end
end
