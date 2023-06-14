class Category < ApplicationRecord
    validates :name, presence: :true, uniqueness: :true
    validates :description, uniqueness: :true

    has_many :post_categories
    has_many :posts, through: :post_category
end
