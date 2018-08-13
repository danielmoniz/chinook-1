class MoveRatingToArtist < ActiveRecord::Migration[5.2]
  def change
    remove_column :tracks, :rating, :integer
    add_column :artists, :rating, :integer
  end
end
