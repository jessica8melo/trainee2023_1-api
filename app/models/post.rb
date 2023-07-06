class Post < ApplicationRecord
    validates :title, :content, presence: :true

    belongs_to :user
    has_many :post_categories, dependent: :destroy
    has_many :categories, through: :post_categories
    has_many :commentaries
end
