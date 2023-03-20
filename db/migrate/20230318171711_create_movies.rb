class CreateMovies < ActiveRecord::Migration[7.0]
  def change
    create_table :movies do |t|
      t.string :title
      t.string :description
      t.string :director
      t.string :mpa_rating
      t.string :movie_length
      t.string :image_path

      t.timestamps
    end
  end
end
