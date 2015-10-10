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
    is_public "false"
    user
  end
end
