ActiveAdmin.register Box do

  permit_params :internal_ref, :status, :token, :localization

  # t.string   "internal_ref"
  # t.datetime "created_at"
  # t.datetime "updated_at"
  # t.string   "status"
  # t.string   "token"

    # permit_params do
  #   permitted = [:permitted, :attributes]
  #   permitted << :other if resource.something?
  #   permitted
  # end

end
