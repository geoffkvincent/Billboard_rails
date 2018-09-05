class AddImageSrcToArtist1 < ActiveRecord::Migration[5.2]
  def change
    add_column :artists, :image_src, :string
  end
end
