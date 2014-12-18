class Statement < ActiveRecord::Base
  require 'date'
  belongs_to :box_session
  scope :last_24h, -> {where('time_of_measure > ? AND time_of_measure <= ?', DateTime.now()-1.day,DateTime.now())}
  scope :last_week, -> {where('time_of_measure > ? AND time_of_measure <= ?', DateTime.now()-7.days,DateTime.now())}
  scope :today, -> {where('time_of_measure > ?', DateTime.now.beginning_of_day())}
  # on n'utilisera pas les scopes correspondant à une journée pour ne pas multiplier les appels à la base
  # à la place on utilisera last_week (ou last_month) et on fera des calculs dans le modèle boxSession
  %w(monday tuesday wednesday thursday friday saturday sunday).each do |day|
     scope ("last_" + day).to_sym, -> {where('time_of_measure > ? AND time_of_measure <= ?',start_day(day),end_day(day) )}
  end

  def user
    return self.box_session.user
  end
end
