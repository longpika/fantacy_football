ActiveAdmin.register Team do
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
      team_players_attributes: [
        :id, :player_id, :_destroy
      ]
    ]
    permitted
  end

  form do |f|
    f.semantic_errors *f.object.errors.keys
    f.inputs "Team Detail" do
      f.input :name
      f.inputs "Player Detail" do
        f.has_many :team_players, allow_destroy: true do |ftp, index|
          ftp.input :player_id, :label => "Player #{index}", :as => :select,
            :collection => User.all.collect{|x| [x.full_name, x.id]}
        end
      end
      f.actions
    end
  end

  index do
    column :id
    column :name
    column :ranking do |r|
      r.ranking.to_f
    end
    column :created_at
    actions
  end

end
