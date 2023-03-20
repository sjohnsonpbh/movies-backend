class CreateMovieUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :movie_users do |t|
      t.bigint :movie_id
      t.bigint :user_id

      t.timestamps
    end
  end
end
