ActiveAdmin.register Sponsorship do
  permit_params :giver_id,:receiver_id,:date_reception,:status,:box_id, :disposal_date, :receiver_email
    # t.integer  "giver_id"
    # t.integer  "receiver_id"
    # t.datetime "date"
    # t.string   "status"
    # t.integer  "box_id"
    # t.datetime "created_at"
    # t.datetime "updated_at"
end
