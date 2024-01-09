class UserSerializer
  include JSONAPI::Serializer
  attributes :name, :email

  has_many :dogs

  attribute :dog_count do |object|
    object.dogs.count
  end
end