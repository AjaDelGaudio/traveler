require 'factory_girl'

FactoryGirl.define do
  factory :user do
    sequence(:username) { |n| "username#{n}" }
    sequence(:email) { |n| "user#{n}@example.com" }
    password "password"
    password_confirmation "password"
  end

  factory :bucket_list do
    sequence(:title) { |n| "My List ##{n}" }
    description "I go places"
    is_public true
    user
  end

  factory :adventure do
    name 'What Bar'
    address 'Beijing, China'
    longitude 116.40739499999995
    latitude 39.904211
    is_achieved false
    notes 'An disturbingly tiny bar on the edge of the Forbidden City'
    bucket_list
  end
end
