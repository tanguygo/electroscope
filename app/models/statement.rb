class Statement < ActiveRecord::Base
  require 'date'
  belongs_to :box_session
  scope :last_24h, -> {where("time_of_measure > #{DateTime.now()-1}")}
  scope :today, -> {where("time_of_measure > #{DateTime.now.beginning_of_day()}")}
  scope :last_week, -> {where("time_of_measure > #{DateTime.now()-7}")}

  %w(monday tuesday wednesday thursday friday saturday sunday).each do |day|
     scope ("last " + day).to_sym, where(last_day_string_generator(day))
   end

  # scope :last_monday, -> {where("time_of_measure > Time.now()-7*24*3600")}
  # scope :last_tuesday, -> {where("time_of_measure > Time.now()-7*24*3600")}
  # scope :last_wednesday, -> {where("time_of_measure > Time.now()-7*24*3600")}
  # scope :last_thursday, -> {where("time_of_measure > Time.now()-7*24*3600")}
  # scope :last_friday, -> {where("time_of_measure > Time.now()-7*24*3600")}
  # scope :last_saturday, -> {where("time_of_measure > Time.now()-7*24*3600")}
  # scope :last_sunday, -> {where("time_of_measure > Time.now()-7*24*3600")}

  def last_day_string_generator(day)
    return "time_of_measure > #{Date.today.beginning_of_week(:day}).midnight-7*24*3600} AND time_of_measure <=  Date.today.beginning_of_week(:#{day}).tomorrow.midnight-7*24*3600"
  end

  def user
    return self.box_session.user
  end
end
