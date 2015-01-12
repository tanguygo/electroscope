class Flat < ActiveRecord::Base
  belongs_to :user
  has_many :devices
  has_many :box_sessions
  has_many :device_types, -> { distinct }, through: :devices

  def set_initial_values
    self.update(number_of_occupants: 1, surface: 80)
  end

  def total_conso_kwh
    total_conso = 0
    self.devices.each do |d|
      total_conso += d.device_type.avg_yearly_consumption
    end
    # 1000 -> constante
    total_conso.to_i / 1000 # pour kWh
  end

  def kwh_price #faker
    (self.last_yearly_bill / total_conso_kwh) / 1000
  end

end
