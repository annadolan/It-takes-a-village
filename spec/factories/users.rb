FactoryGirl.define do
  factory :user do
    first_name "Jyn"
    last_name "Erso"
    street_number "1510 Blake St."
    city "Denver"
    state "Co"
    zip_code "80202"
    email
    picture "https://images-na.ssl-images-amazon.com/images/M/MV5BNzEyNjNhYTktZWMwMC00Njk4LTg0OWYtZDNiODc0YzEwNDBhL2ltYWdlL2ltYWdlXkEyXkFqcGdeQXVyMjk3NTUyOTc@._V1_UY98_CR4,0,67,98_AL_.jpg"
    password "test"
    phone Faker::PhoneNumber.phone_number
    category
  end

  sequence :email do |n|
    "user#{n}@test.com"
  end
end
