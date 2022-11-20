class AddCommentToMovie < ActiveRecord::Migration[7.0]
  def change
    add_reference :comments, :movie, null: false, foreign_key: true
  end
end
