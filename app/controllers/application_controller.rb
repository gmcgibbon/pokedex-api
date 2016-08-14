class ApplicationController < ActionController::API
  include Knock::Authenticable

  def redirect
    redirect_to pokemon_path Pokemon.sample
  end
end
