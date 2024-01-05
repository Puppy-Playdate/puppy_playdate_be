class DogSerializer
  include JSONAPI::Serializer
  attributes :name, :breed, :age, :size, :neutered
end