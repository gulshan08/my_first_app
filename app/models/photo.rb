class Photo < ApplicationRecord
  belongs_to :photoable, polymorphic: true, optional: true
  has_attached_file :photo_image, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :photo_image, content_type: /\Aimage\/.*\z/
end
