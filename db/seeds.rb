# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first

user = User.create(
  username: "username",
  email: "user@email.com",
  password: "password",
  password_confirmation: "password"
)

bucket_list = BucketList.create(
  title: 'Bucket List 1',
  is_public: true
)

adventure_1 = Adventure.create(
  name: 'do things'
)

adventure_2 = Adventure.create(
  name: 'do other things'
)

adventure_bucket_join_1 = BucketListAdventure.create(
  adventure_id: 1,
  bucket_list_id: 1,
  is_achieved: false,
  notes: "blah blah blah"
)

adventure_bucket_join_2 = BucketListAdventure.create(
  adventure_id: 2,
  bucket_list_id: 1,
  is_achieved: true,
  notes: "blah blah blah"
)
