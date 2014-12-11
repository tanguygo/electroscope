ActiveAdmin.register DeviceType do
  permit_params :type, :avg_daily_consumption, :avg_monthly_consumption_01, :avg_yearly_consumption
  # t.string   "type"
  # t.float    "avg_daily_consumption"
  # t.float    "avg_monthly_consumption_01"
  # t.float    "avg_yearly_consumption"
  # t.datetime "created_at"
  # t.datetime "updated_at"


end
