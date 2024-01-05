class Dog < ApplicationRecord
  enum size: {
              small: 0,
              medium: 1,
              large: 2
              }

  belongs_to :user             
end
