class Box < ActiveRecord::Base
  has_many :boxsessions, :orders, :sponsorships
end
