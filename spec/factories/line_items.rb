FactoryBot.define do
  factory :line_item do
    product { "MyString" }
    references { "MyString" }
    cart { nil }
  end
end
