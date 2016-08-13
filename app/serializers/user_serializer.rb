class UserSerializer < ActiveModel::Serializer
  attributes :sub, :email, :first_name, :last_name
end
