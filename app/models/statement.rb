class Statement < ActiveRecord::Base
  require 'date'
  belongs_to :box_session
  scope :last_24h, -> {where("time_of_measure > Time.now()-24*3600")}
  scope :today, -> {where("time_of_measure > Datetime.now.beginning_of_day()")}
  scope :last_week, -> {where("time_of_measure > Datetime.now()-7*24*3600")}

  scope :last_monday, -> {where("time_of_measure > Time.now()-7*24*3600")}
  scope :last_tuesday, -> {where("time_of_measure > Time.now()-7*24*3600")}
  scope :last_wednesday, -> {where("time_of_measure > Time.now()-7*24*3600")}
  scope :last_thursday, -> {where("time_of_measure > Time.now()-7*24*3600")}
  scope :last_friday, -> {where("time_of_measure > Time.now()-7*24*3600")}
  scope :last_saturday, -> {where("time_of_measure > Time.now()-7*24*3600")}
  scope :last_sunday, -> {where("time_of_measure > Time.now()-7*24*3600")}

  def user
    return self.box_session.user
  end
end
