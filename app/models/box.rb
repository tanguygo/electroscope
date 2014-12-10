class Box < ActiveRecord::Base
  has_many :box_sessions
  has_many :orders
  has_many :sponsorships
end
