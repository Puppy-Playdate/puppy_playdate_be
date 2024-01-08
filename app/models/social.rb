class Social < ApplicationRecord
  validates :name, :description, :location, :event_date, :event_type, presence: true 
  enum event_type: {
    chill: 0,
    playdate: 1,
    walk: 2
    }
    belongs_to :user
  # has_many :user_socials
  # has_many :users, through: :user_socials 
end
