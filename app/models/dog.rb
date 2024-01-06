class Dog < ApplicationRecord
  validates_presence_of :name, :breed, :age, :size
  
  enum size: {
              small: 0,
              medium: 1,
              large: 2
              }

  belongs_to :user
end
