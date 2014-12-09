class BoxSession < ActiveRecord::Base
  belongs_to :flat
  belongs_to :box
end
