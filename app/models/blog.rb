class Blog < ApplicationRecord
  belongs_to :user
  has_one_attached :thumbnail
  has_one_attached :banner

  has_rich_text :body
  def optimized_image(image,x,y)
    retrun image.variant(resize_to_fill: [x,y]).processed
  end

end
