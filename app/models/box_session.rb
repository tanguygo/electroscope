class BoxSession < ActiveRecord::Base
  belongs_to :flat
  belongs_to :box

  def user
    return self.flat.user
  end

  def sqf
    p self
  end
end
