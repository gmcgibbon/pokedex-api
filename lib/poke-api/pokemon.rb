module PokeAPI
  class Pokemon < Resource

    attr_reader :name, :image_url

    resource :pokemon

    def initialize(json)
      @name      = json[:name].titleize
      @image_url = json[:sprites][:front_default]
    end
  end
end
