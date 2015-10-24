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
    user_id 1
  end

  factory :bucket_list_adventure do
    bucket_list_id 1
    adventure_id 1
    is_achieved false
    notes "bring beer"
  end

  factory :adventure do
    name "go spelunking"
    address "Vietnam"
  end

  factory :adventure_user do
    adventure_id 1
    user_id 1
  end
end
