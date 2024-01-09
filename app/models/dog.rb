class Dog < ApplicationRecord
  validates_presence_of :name, :breed, :age, :size
  validates :neutered, inclusion: { in: [true, false] }
  validates :age, numericality: { only_integer: true }
  
  enum size: {
              small: 0,
              medium: 1,
              large: 2
              }

  belongs_to :user
end
