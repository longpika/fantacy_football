class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :team_players, foreign_key: :player_id

  def full_name
    return 'Anonymus' unless self.first_name && self.last_name
    return self.first_name.to_s + ' ' + self.last_name.to_s
  end
end
