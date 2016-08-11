module PokeAPI
  class Resource

    include HTTParty

    class << self
      def resource(name)
        base_uri "#{PokeAPI::BASE_URL}/#{name}"
      end

      def get(*params)
        new JSON.parse(super.body, symbolize_names: true)
      end

      def find(*id_params)
        found     = id_params.flatten.map { |id_param| get "/#{id_param}" }
        not_array = true unless id_params.first.is_a?(Array)
        if found.one? && not_array then found.first else found end
      end
    end
  end
end
