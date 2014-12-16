class Sponsorship < ActiveRecord::Base
  belongs_to :box
  belongs_to :giver, :class_name => "User", :foreign_key => "giver_id"
  belongs_to :receiver, :class_name => "User", :foreign_key => "receiver_id"

  def send_sponsor_giver_email(giver)
    UserMailer.sponsor_giver(self, giver).deliver
  end

  def send_sponsor_receiver_email(giver)
    UserMailer.sponsor_receiver(self, giver).deliver
  end

end
