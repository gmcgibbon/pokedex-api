class Pokemon < ApplicationRecord

  mount_base64_uploader :image, Pokemon::ImageUploader

  validates :name, presence: true

  def self.from_api(api_pokemon)
    new(name: api_pokemon.name, remote_image_url: api_pokemon.image_url)
  end
end
