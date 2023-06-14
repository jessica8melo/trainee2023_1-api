class Post < ApplicationRecord
    validates :title, :content, presence: :true

    belongs_to :user, -> { where is_admin: true }
    has_many :post_categories
    has_many :categories, through: :post_category
    has_many :commentaries
end
