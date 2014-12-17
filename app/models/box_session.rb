class BoxSession < ActiveRecord::Base
  belongs_to :flat
  belongs_to :box
  has_many :statements
  has_many :sponsorships, through: :box

  after_create :check_if_sponsored

  def user
    return self.flat.user
  end

  def plateau?(power)
    return self.statements[-1].power.to_i==self.statements[-2].power.to_i && self.statements[-1].power.to_i==power.to_i
  end

  def check_if_sponsored
    if s = self.box.active_sponsorships.first
      s.update_attributes(status: 'complete', receiver: self.user)
    end
  end

  def send_activation_email
    UserMailer.activation(self).deliver
  end

end
