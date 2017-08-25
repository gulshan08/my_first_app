class Account < ApplicationRecord
  validates :mobile_number,presence: true
  validates_length_of :mobile_number, is: 10,  message: "Number must be 10 digit long"
  belongs_to :user
  mount_uploader :upload_photo, AvatarUploader
  has_attached_file :upload_by_paperclip, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :upload_by_paperclip, content_type: /\Aimage\/.*\z/
end