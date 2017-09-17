class Team < ApplicationRecord
  has_many :team_players, dependent: :destroy
  has_many :players, through: :team_players

  validate do
    check_player_number
  end

  accepts_nested_attributes_for :team_players, allow_destroy: true

  private

    def check_player_number
      number = team_players.length
      p '=============================================================='
      p number
      if number > 2
        errors[:base] << 'One team only have two players'
      end
    end
end
