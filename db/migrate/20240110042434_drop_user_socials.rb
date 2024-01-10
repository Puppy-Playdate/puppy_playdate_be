class DropUserSocials < ActiveRecord::Migration[7.1]
  def change
    drop_table :user_socials
  end
end
