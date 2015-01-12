class Box < ActiveRecord::Base
  has_many :box_sessions
  has_many :orders
  has_many :sponsorships

  def user
    # return useless, pas besoin
    return self.box_sessions.last.user
  end

  def statements
    return self.box_sessions.last.statements
  end
end
