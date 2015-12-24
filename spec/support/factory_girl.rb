require 'factory_girl'

FactoryGirl.define do
  factory :user do
    sequence(:username) { |n| "username#{n}" }
    sequence(:email) { |n| "user#{n}@example.com" }
    password "password"
    password_confirmation "password"
  end

  factory :bucket_list do
    sequence(:title) { |n| "My Bucket List ##{n}" }
    description "I go places"
    is_public true
    user
  end

  factory :bucket_list_adventure do
    bucket_list_id 1
    adventure_id 1
  end

  factory :adventure do
    name "go spelunking"
    address "Vietnam"
    is_achieved false
    is_shared false
    link "www.google.com"
    notes "bring beer"
  end
end
