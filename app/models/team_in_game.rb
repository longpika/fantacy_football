class TeamInGame < ApplicationRecord
  belongs_to :team
  belongs_to :match

  validates_uniqueness_of :team_id, :scope => [:match_id]

  # before_create :check_team_number

  private

  def check_team_number
    return unless self
    team_id = self.id
    match_id = self.match_id
    error_string = 'abc'
    number = TeamInGame.where(team_id: team_id, match_id: match_id)
  end
end
