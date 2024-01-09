class SocialSerializer
  include JSONAPI::Serializer
  attributes :name, :description, :location, :event_date, :event_type
end