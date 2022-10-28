class Package < ApplicationRecord
  belongs_to :place
  belongs_to :hotel
  belongs_to :room
end
