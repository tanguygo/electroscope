class Sponsorship < ActiveRecord::Base
  belongs_to :box
  belongs_to :giver, :class_name => "User", :foreign_key => "giver_id"
  belongs_to :receiver, :class_name => "User", :foreign_key => "receiver_id"
  scope :active, -> {where(status: 'active')}
  after_create :send_sponsor_giver_email
  after_create :send_sponsor_receiver_email

  def send_sponsor_giver_email
    UserMailer.sponsor_giver(self).deliver
  end

  def send_sponsor_receiver_email
    UserMailer.sponsor_receiver(self).deliver
  end

end
