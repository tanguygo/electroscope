ActiveAdmin.register User do
  permit_params :email,:last_name,:first_name,:birthday,:civility,:admin

  # t.string   "email",                  default: "", null: false
  # t.string   "encrypted_password",     default: "", null: false
  # t.string   "reset_password_token"
  # t.datetime "reset_password_sent_at"
  # t.datetime "remember_created_at"
  # t.integer  "sign_in_count",          default: 0,  null: false
  # t.datetime "current_sign_in_at"
  # t.datetime "last_sign_in_at"
  # t.inet     "current_sign_in_ip"
  # t.inet     "last_sign_in_ip"
  # t.datetime "created_at"
  # t.datetime "updated_at"
  # t.string   "last_name"
  # t.string   "first_name"
  # t.date     "birthday"
  # t.string   "provider"
  # t.string   "uid"
  # t.string   "picture"
  # t.string   "token"
  # t.datetime "token_expiry"
  # t.string   "civility"
  # t.boolean  "admin"
end
