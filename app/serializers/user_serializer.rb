class UserSerializer
  include JSONAPI::Serializer
  attributes :name, :email, :oauth_token, :uid

  has_many :dogs

  attribute :dog_count do |object|
    object.dogs.count
  end
end