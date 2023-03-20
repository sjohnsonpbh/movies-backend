class CreateReviews < ActiveRecord::Migration[7.0]
  def change
    create_table :reviews do |t|
      t.integer :user_rating
      t.text :comment
      t.bigint :user_id, null: false, foreign_key: true
      t.bigint :movie_id, null: false, foreign_key: true

      t.timestamps
    end
  end
end
