ActiveAdmin.register Match do
# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
# permit_params :list, :of, :attributes, :on, :model
#
# or
#
# permit_params do
#   permitted = [:permitted, :attributes]
#   permitted << :other if params[:action] == 'create' && current_user.admin?
#   permitted
# end

  permit_params do
    permitted = [
      :name,
      games_attributes: [
        :id, :name, :winner_team_id, :score, :_destroy
      ],
      team_in_games_attributes: [
        :id, :team_id, :_destroy
      ]
    ]
    permitted
  end

  form do |mf|
    mf.semantic_errors *mf.object.errors.keys
    mf.inputs "Match Detail" do
      mf.hidden_field :id
      mf.input :name
      mf.inputs "Game Detail" do
        mf.has_many :games, allow_destroy: true do |g|
          g.input :name
        end
      end
      mf.inputs "Teams Detail" do
        mf.has_many :team_in_games, allow_destroy: true do |g, index|
          g.input :team_id, :label => "Team #{index}", :as => :select,
            :collection => Team.all.collect{|x| [x.name, x.id]}
        end
      end
      if mf.object.id
        mf.inputs "Match Result" do
          mf.has_many :games, allow_destroy: true do |g|
            g.input :winner_team_id, :label => 'Winner Team', :as => :select,
              :collection => mf.object.teams.collect{|x| [x.name, x.id]},
              selected: "Select Winner Team"
            g.input :score, :label => 'Score', :as => :select,
              :collection => (1..10).collect{|x| [x, x]},
              selected: "Select Score"
          end
        end
      end
      mf.actions
    end
  end

  show do |f|
    panel "Match Details" do
      attributes_table_for f, :id, :name, :winner_team
    end

    panel "List Games" do
      table_for(f.games) do |game|
        column :name
        column :winner_team
        column :score
      end
    end
  end

end
