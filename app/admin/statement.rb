ActiveAdmin.register Statement do
  permit_params :box_session_id,:time_of_measure,:pulse,:power
  # t.datetime "created_at"
  # t.datetime "updated_at"
  # t.integer  "box_session_id"
  # t.datetime "time_of_measure"
  # t.float    "pulse"
  # t.float    "power"
end
