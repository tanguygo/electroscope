class BoxSession < ActiveRecord::Base
  belongs_to :flat
  belongs_to :box
  has_many :statements
  has_many :sponsorships, through: :box

  after_create :check_if_sponsored

  def activate
    self.update(start_date:Time.now(),activated:true,connected:false)
    self.box.update(localization: "client")
  end

  def connect
    self.update(activated:true)
  end

  def treat_impulse(statement_params)
    if self.statements.size<=1 || self.plateau?(statement_params[:power]) == false
      self.connect if self.statements.size==0
      self.add_a_point(statement_params)
    else # If power has not changed, we update the time of the last point
      self.statements.last.update(time_of_measure: statement_params[:time_of_measure])
    end
  end

  def add_a_point(statement_params)
    self.statements.create(statement_params)
  end

  def user
    return self.flat.user
  end

  def plateau?(power)
    return self.statements[-1].power.to_i==self.statements[-2].power.to_i && self.statements[-1].power.to_i==power.to_i
  end

  def check_if_sponsored
    if s = self.box.sponsorships.active.first
      s.update_attributes(status: 'complete', receiver: self.user)
    end
  end

  def send_activation_email
    UserMailer.activation(self).deliver
  end

end
