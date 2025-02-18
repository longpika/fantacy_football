ActiveAdmin.register User do
  form :partial => "form"
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
  form do |f|
    f.inputs "User Detail" do
      f.input :email
      f.input :password, as: :password
      f.input :first_name
      f.input :last_name
      f.actions
    end
  end

  index do
    column :id
    column :email
    column :first_name
    column :last_name
    column :created_at
    actions
  end

  permit_params do
    permitted = [:email, :password, :first_name, :last_name]
    # permitted << :other if params[:action] == 'create' && current_user.admin?
    permitted
  end

end
