class BoxSession < ActiveRecord::Base
  belongs_to :flat
  belongs_to :box
  has_many :statements

  def user
    return self.flat.user
  end

  def plateau?(power)
    return self.statements[-1].power==self.statements[-2].power && self.statements[-1].power==power
  end

end
