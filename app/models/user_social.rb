class UserSocial < ApplicationController
  belongs_to :users
  belongs_to :socials 
end