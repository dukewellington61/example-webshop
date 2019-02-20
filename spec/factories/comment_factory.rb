FactoryBot.define do

  factory :comment do

    association :user
    association :product

    body {"I am the body"}
    rating {5}
    user_id {user.id}
    product_id {product.id}
  end
end
