class CreateSocials < ActiveRecord::Migration[7.1]
  def change
    create_table :socials do |t|
      t.string :name
      t.string :description
      t.integer :event_type, default: 0  
      t.datetime :event_date

      t.timestamps
    end
  end
end
