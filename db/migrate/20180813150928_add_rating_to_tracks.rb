class AddRatingToTracks < ActiveRecord::Migration[5.2]
  def change
    add_column :tracks, :rating, :integer
  end
end
