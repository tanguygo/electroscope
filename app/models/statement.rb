class Statement < ActiveRecord::Base
  belongs_to :box_session
  def user
    return self.box_session.user
  end
end
