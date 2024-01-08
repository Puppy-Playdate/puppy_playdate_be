class AddUserRefToSocials < ActiveRecord::Migration[7.1]
  def change
    add_reference :socials, :user, null: false, foreign_key: true
  end
end
