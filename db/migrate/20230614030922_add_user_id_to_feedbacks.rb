class AddUserIdToFeedbacks < ActiveRecord::Migration[7.0]
  def change
    add_reference :feedbacks, :user, null: false, foreign_key: true
  end
end
