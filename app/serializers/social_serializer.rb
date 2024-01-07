class SocialSerializer
  include JSONAPI::Serializer
  attributes :name, :description, :event_date, :event_type
end