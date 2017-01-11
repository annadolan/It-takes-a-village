FactoryGirl.define do
  factory :user do
    first_name "Jyn"
    last_name "Erso"
    street_number "1510 Blake St."
    city "Denver"
    state "Co"
    zip_code "80202"
    email
    password "test"
    phone Faker::PhoneNumber.phone_number
  end

  sequence :email do |n|
    "user#{n}@test.com"
  end
end
