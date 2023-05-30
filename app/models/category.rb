class Category < ApplicationRecord
    has_many :post_category

    validates :name, presence: :true, uniqueness: :true
end
