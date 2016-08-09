class Pokemon < ApplicationRecord

  mount_uploader :image, Pokemon::ImageUploader

  validates :name, presence: true
end
