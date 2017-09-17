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
        :id, :name, :_destroy
      ]
    ]
    permitted
  end

  form do |mf|
    mf.semantic_errors *mf.object.errors.keys
    mf.inputs "Match Detail" do
      mf.input :name
      mf.inputs "Game Detail" do
        mf.has_many :games, allow_destroy: true do |g|
          g.input :name
        end
      end
      mf.actions
    end
  end

  show do |f|
    panel "Match Details" do
      attributes_table_for f, :id, :name
    end

    panel "List Games" do
      table_for(f.games) do |game|
        column :name
        column :winner_team
        column :loser_team
        column :score
      end
    end
  end

end
