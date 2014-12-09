class Device < ActiveRecord::Base
  belongs_to :devicetype
  belongs_to :flat
end
