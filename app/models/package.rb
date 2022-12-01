class Package < ApplicationRecord
  validates :package_no, :package_name, :pack_description, :facilities,:price,:hotel_id, :img_url, :place_id, presence: true

   belongs_to :place
   belongs_to :hotel

end
