require 'rails_helper'

RSpec.describe Admin::MatchesController do
  context 'Creating a new match' do
    it 'Should show error message' do
      @match = Match.new(name: 'New Game')
      flag = @match.save
      expect(flag).to eq(false)
      p @match.errors.messages[:base][0]
    end

    before {
      @team1 = Team.create!(name: 'Team1')
      @team2 = Team.create!(name: 'Team2')
      for i in 1..4 do
        User.create!(email: "longpv710#{i}@gmail.com",
          first_name: "#{i}", last_name: 'Long', password: 'password')
      end
      @user_ids = User.all.pluck(:id)
      @team1.team_players.create(player_id: @user_ids[0])
      @team1.team_players.create(player_id: @user_ids[1])
      @team2.team_players.create(player_id: @user_ids[2])
      @team2.team_players.create(player_id: @user_ids[3])
    }

    it 'Should create match successful' do
      @match = Match.new(name: 'New Game')
      @game_1 = @match.games.new(name: 'Route 1')
      @game_2 = @match.games.new(name: 'Route 2')
      flag = @match.save
      expect(flag).to eq(true)
    end
  end
end
