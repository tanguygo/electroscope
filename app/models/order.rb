class Order < ActiveRecord::Base
  belongs_to :offer
  belongs_to :box
  belongs_to :user

  def set_initial_values
    self.update(status: "ordered_no_payment", creation_date: Time.now)
  end

end
