FactoryBot.define do

  sequence(:email) {|n| "test#{n}@example.com"}


  factory :user do
    email
    first_name {"Test"}
    last_name {"User"}
    password {"1234567890"}
    admin {false}
  end

  factory :admin, class: User do
    email
    password {"test123"}
    first_name {"John"}
    last_name {"Doe"}
    admin {true}
  end

end
