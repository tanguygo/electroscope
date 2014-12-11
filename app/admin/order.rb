ActiveAdmin.register Order do

  permit_params :creation_date,:status,:counter_type,:delivery_option,:offer_id,\
  :box_id,:user_id, :street_number, :route, :locality, :administrative_area_level_1, \
  :postal_code, :country, :address_complement,:address


    # t.datetime "creation_date"
    # t.string   "status"
    # t.string   "counter_type"
    # t.string   "delivery_option"
    # t.integer  "offer_id"
    # t.integer  "box_id"
    # t.integer  "user_id"
    # t.datetime "created_at"
    # t.datetime "updated_at"
    # t.string   "street_number"
    # t.string   "route"
    # t.string   "locality"
    # t.string   "administrative_area_level_1"
    # t.string   "postal_code"
    # t.string   "country"
    # t.string   "address_complement"
    # t.string   "address"


end
