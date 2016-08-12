class Pokemon < ApplicationRecord

  mount_base64_uploader :image, Pokemon::ImageUploader

  validates :name, presence: true
end
