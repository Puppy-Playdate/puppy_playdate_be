class UserSerializer
  include JSONAPI::Serializer
  attributes :name, :email, :uid

  has_many :dogs

  attribute :dog_count do |object|
    object.dogs.count
  end
end