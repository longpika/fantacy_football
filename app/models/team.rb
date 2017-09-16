class Team < ApplicationRecord
  has_many :team_players, dependent: :destroy
  has_many :players, through: :team_players

  accepts_nested_attributes_for :team_players

  validate :check_player_numbers

  def check_player_numbers
    number = self.players.length
    errors.add(:base, 'One team only have two players') if number > 2
  end
end
