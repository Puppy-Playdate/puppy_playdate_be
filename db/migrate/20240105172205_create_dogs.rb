class CreateDogs < ActiveRecord::Migration[7.1]
  def change
    create_table :dogs do |t|
      t.string :name
      t.string :breed
      t.integer :age
      t.integer :size, default: 0
      t.boolean :neutered

      t.timestamps
    end
  end
end
