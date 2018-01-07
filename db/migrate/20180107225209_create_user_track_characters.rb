class CreateUserTrackCharacters < ActiveRecord::Migration[5.1]
  def change
    create_table :user_track_characters do |t|
      t.references :user, foreign_key: true
      t.references :track_character, foreign_key: true
      t.integer :assessment

      t.timestamps
    end
  end
end
