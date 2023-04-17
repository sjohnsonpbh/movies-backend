class ChangeReviewsTable < ActiveRecord::Migration[7.0]
  def change
    remove_column :reviews, :comment, :text
    add_column :reviews, :review, :text
  end
end
