class CreateLocations < ActiveRecord::Migration
  def change
    create_table :locations do |t|
      t.decimal :latitude, precision: 9, scale: 7
      t.decimal :longitude, precision: 9, scale: 7
      t.references :user
      t.timestamps null: false
    end
  end
end
