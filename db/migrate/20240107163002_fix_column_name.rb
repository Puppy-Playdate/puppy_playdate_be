class FixColumnName < ActiveRecord::Migration[7.1]
  def change
    rename_column :socials, :locaion, :location
  end
end
