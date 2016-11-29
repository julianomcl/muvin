class AddSpotifyHash < ActiveRecord::Migration
  def change
    add_column :users, :spotify, :text
  end
end
