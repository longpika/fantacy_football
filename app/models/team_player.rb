class TeamPlayer < ApplicationRecord
  belongs_to :team
  belongs_to :player, class_name: 'User'

  validates_uniqueness_of :player_id, :scope => [:team_id]
end
