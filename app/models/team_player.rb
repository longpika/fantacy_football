class TeamPlayer < ApplicationRecord
  belongs_to :team
  belongs_to :player, class_name: 'User'
end
