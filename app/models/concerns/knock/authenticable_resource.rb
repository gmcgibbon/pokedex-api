module Knock::AuthenticableResource
  extend ActiveSupport::Concern

  included do
    alias_attribute :sub, :id
  end

  class_methods do
    def from_token_payload(payload)
      find payload['sub']
    end

    def from_token_request(request)
      email = request.params['auth'] && request.params['auth']['email']
      find_by email: email
    end
  end

  def to_token_payload
    UserSerializer.new(self).as_json
  end
end
