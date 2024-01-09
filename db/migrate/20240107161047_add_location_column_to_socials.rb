class AddLocationColumnToSocials < ActiveRecord::Migration[7.1]
  def change
    add_column :socials, :locaion, :string 
  end
end
