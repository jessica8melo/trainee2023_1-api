class CreateFeedbacks < ActiveRecord::Migration[7.0]
  def change
    create_table :feedbacks do |t|
      t.boolean :like
      t.references :post, null: false, foreign_key: true

      t.timestamps
    end
  end
end
