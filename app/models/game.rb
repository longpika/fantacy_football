class Game < ApplicationRecord
  belongs_to :match
  belongs_to :winner_team, class_name: 'Team', optional: true
  has_many :teams, through: :match
end
