class AddNewRatingColumnSongs < ActiveRecord::Migration[5.2]
  def change
    add_column :songs, :ratings, :integer
  end
end
