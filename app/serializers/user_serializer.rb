class UserSerializer < ActiveModel::Serializer
  attributes :id, :name, :bio, :genres
end
