class Room < ApplicationRecord
  belongs_to :place
  belongs_to :hotel
end
