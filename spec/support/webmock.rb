RSpec.configure do |config|

  config.before(:each) do
    stub_request(:get, 'http://pokeapi.co/api/v2/pokemon/mock')
      .to_return(status: 200, body: test_pokemon_json, headers: {})

    stub_request(:get, 'http://pokeapi.co/media/sprites/pokemon/mock.png')
      .to_return(status: 200, body: test_image, headers: {})
  end


end
