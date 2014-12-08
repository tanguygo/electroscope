class Order < ActiveRecord::Base
  belongs_to :offer
  belongs_to :box
  belongs_to :user
end
