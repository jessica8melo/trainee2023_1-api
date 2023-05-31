FactoryBot.define do
  sequence :category_name do |n|
    "Category #{n}"
  end

  factory :category do
    name { generate(:category_name) }
    description { "MyText" }
  end
end
