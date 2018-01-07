class CreateTrackCharacters < ActiveRecord::Migration[5.1]
  def change
    create_table :track_characters do |t|
      t.string :track_id
      t.float :acousticness
      t.float :danceability
      t.integer :duration_ms
      t.float :energy
      t.float :instrumentalness
      t.integer :key
      t.float :liveness
      t.float :loudness
      t.integer :mode
      t.float :speechiness
      t.float :tempo
      t.integer :time_signature
      t.float :valence

      t.timestamps
    end
  end
end
