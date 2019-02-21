FactoryBot.define do

  factory :comment do

    association :user
    association :product

    body {"I am the body"}
    rating {5}    
  end
end
