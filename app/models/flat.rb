class Flat < ActiveRecord::Base
  belongs_to :user
  has_many :devices
  has_many :box_sessions
end