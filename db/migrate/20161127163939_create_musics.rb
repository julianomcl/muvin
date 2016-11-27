class CreateMusics < ActiveRecord::Migration
  def change
    create_table :musics do |t|
      t.string :track_name, null: false
      t.string :artist_name, null: false
      t.references :location
      t.timestamps null: false
    end
  end
end
