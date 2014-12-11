ActiveAdmin.register Flat do
  permit_params :street_number, :route, :locality, :administrative_area_level_1, \
  :postal_code, :country, :number_of_occupants,:surface,:latitude,:longitude,:last_yearly_bill,:user_id,:address_complement


  # t.datetime "created_at"
  # t.datetime "updated_at"
  # t.string   "street_number"
  # t.string   "route"
  # t.string   "locality"
  # t.string   "administrative_area_level_1"
  # t.string   "postal_code"
  # t.string   "country"
  # t.integer  "number_of_occupants"
  # t.float    "surface"
  # t.float    "latitude"
  # t.float    "longitude"
  # t.float    "last_yearly_bill"
  # t.integer  "user_id"
  # t.string   "address_complement"


end
