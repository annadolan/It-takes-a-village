FactoryGirl.define do
  factory :task do
    event
    user
    category 
    name "MyString"
    date "MyString"
    time "MyString"
  end
end
