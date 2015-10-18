# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first

User.create(
  username: "username",
  email: "user@email.com",
  password: "password",
  password_confirmation: "password"
)

user_1_list_1 = BucketList.create(title: "Summer Vacation", is_public: false)

Adventure.create(
  name: "Eat a traditional Inuit meal"
  is_achieved: false
)

BucketListAdventure.create(
  adventure_id: 1,
  bucket_list_id: 1,
  is_achieved: false,
  notes: "Invite Maggie along"
)

Adventure.create(
  name: "Scuba diving through WWII wreck"
  address: "Palawan, Phillipeans"
  notes: "Will need at least 1 week"
)

BucketListAdventure.create(
  adventure_id: 2,
  bucket_list_id: 1,
  is_achieved: false,
)

Adventure.create(
  address: "Halifax, Canada"
)

BucketListAdventure.create(
  adventure_id: 2,
  bucket_list_id: 1,
  is_achieved: false,
)


user_1_list_1 = BucketList.create(title: "Africa", is_public: false)

Adventure.create(
  name: "Safari"
  addres: "Kenya"
  is_achieved: false
)

BucketListAdventure.create(
  adventure_id: 2,
  bucket_list_id: 2,
  is_achieved: false,
  notes: "Buy a really nice camera and take a picture of a zebra for Lily"
)

Adventure.create(
  addres: "Cape Town, South Africa"
  is_achieved: false
)

BucketListAdventure.create(
  adventure_id: 2,
  bucket_list_id: 2,
  is_achieved: false,
  notes: "Buy a really nice camera and take a picture of a zebra for Lily"
)



BucketList.create(
  title: "Jan, Clem, and Sam traverse South America",
  is_public: true
)

user = User.create(
  username: "username2",
  email: "user2@email.com",
  password: "password",
  password_confirmation: "password"
)






BucketList.create(title: "Mountain Climbing Challenge", is_public: true)

BucketList.create(
  title: "Europe to Asia by Train",
  description: "Husband, neice, brother,and I are traveling from London to"\
  "Thailand by land.  We will not take any planes!"
  is_public: true
)

BucketList.create(
  title: "Someday",
  description: "After I pay off my college loans"
  is_public: false
)

BucketList.create(
  title: "Google Self-Driving Solar Car Tour",
  description: "Longest test drive of the world's first self-driving Solar"\
  "powered car.  Six drivers will rotate shifts driving from Nome, Alaska to"\
  "Ushuaia, Argentina with stops in major cities along the way!"
  is_public: true
)






adventure_bucket_join_2 = BucketListAdventure.create(
  adventure_id: 2,
  bucket_list_id: 1,
  is_achieved: true,
  notes: "blah blah blah"
)
