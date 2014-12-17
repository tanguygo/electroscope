class Flat < ActiveRecord::Base
  belongs_to :user
  has_many :devices, dependent: :destroy
  has_many :device_types, through: :devices
  has_many :box_sessions

  def set_initial_values
    self.update(number_of_occupants: 1, surface: 80)
  end
end
