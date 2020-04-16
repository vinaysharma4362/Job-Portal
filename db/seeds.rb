# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database
# with its default values.
# The data can then be loaded with the rails db:seed command (or created
# alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' },
# { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.create(
  email: 'admin@gmail.com',
  first_name: 'admin',
  last_name: 'panel',
  mobile: '9889989898',
  password: '123456'
)

admin = User.find_by(email: 'admin@gmail.com')
admin.add_role :admin

User.create(
  email: 'v@1.com',
  first_name: 'user1',
  last_name: 'v@1',
  mobile: '9889989898',
  password: '123456'
)

User.create(
  email: 'v@2.com',
  first_name: 'user2',
  last_name: 'v@2',
  mobile: '9889989898',
  password: '123456'
)

User.create(
  email: 'v@3.com',
  first_name: 'user3',
  last_name: 'v@3',
  mobile: '9889989898',
  password: '123456'
)

Company.create(
  email: 'c@1.com',
  title: 'Company1',
  about: "Lorem Ipsum is simply dummy text of the printing and typesetting
  industry. Lorem Ipsum has been the industry's standard dummy text ever
  since the 1500s, when an unknown printer took a galley of type and scrambled
  it to make a type specimen. It has survived not only five centuries, but
  also the leap into electronic typesetting, remaining essentially
   unchanged. It was popularised in the 1960s with the release of Letraset
   sheets containing Lorem Ipsum passages, and more recently with desktop
  publishing software like Aldus PageMaker including versions of Lorem Ipsum.",
  password: '123456',
  city: 'Ahmedabad',
  state: 'Gujarat',
  country: 'India',
  pincode: '380061',
  contact_no: '9898989898',
  website: 'www.company1.com'
)

Company.create(
  email: 'c@2.com',
  city: 'Ahmedabad',
  title: 'Company2',
  state: 'Gujarat',
  country: 'India',
  pincode: '380081',
  contact_no: '9898585898',
  website: 'www.company2.com',
  about: "Lorem Ipsum is simply dummy text of the printing and typesetting
  industry. Lorem Ipsum has been the industry's standard dummy text ever since
  the 1500s, when an unknown printer took a galley of type and scrambled it to
  make a type specimen book. It has survived not only five centuries, but also
  the leap into electronic typesetting, remaining essentially unchanged. It was
  popularised in the 1960s with the release of Letraset sheets containing Lorem
  Ipsum passages, and more recently with desktop publishing software like Aldus
  PageMaker including versions of Lorem Ipsum.",
  password: '123456'
)

JobPost.create(
  job_title: 'Ux designer',
  company_id: 1,
  salary_min: 10_000,
  job_type: 'Full-time',
  location: 'Ahmedabad, Gj',
  description: "It is a long established fact that a reader will be distracted
  by the readable content of a page when looking at its layout. The point of
  using Lorem Ipsum is that it has a more-or-less normal distribution of
  letters, as opposed to using 'Content here, content here', making it look
  like readable English. Many desktop publishing packages and web page editors
   now use Lorem Ipsum as their default model text, and a search for
   'lorem ipsum' will uncover many web sites still in their infancy. Various
    versions have evolved over the years, sometimes by acciden.",
  salary_max: 20_000
)

JobPost.create(
  job_title: 'Software developer',
  company_id: 2,
  salary_min: 15_000,
  job_type: 'Part-time',
  location: 'Surat, Gj',
  description: "It is a long established fact that a reader will be distracted
  by the readable content of a page when looking at its layout. The point of
  using Lorem Ipsum is that it has a more-or-less normal distribution of
  letters, as opposed to using 'Content here, content here', making it look
  like readable English. Many desktop publishing packages and web page editors
   now use Lorem Ipsum as their default model text, and a search for
   'lorem ipsum' will uncover many web sites still in their infancy. Various
    versions have evolved over the years, sometimes by accident",
  salary_max: 25_000
)

Review.create(
  rating: 3,
  review_desc: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit,
  sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim
     ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip
      ex ea commodo consequat. Duis aute irure dolor in reprehenderit in
      voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur
      sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt
       mollit anim id est laborum',
  user_id: 1,
  company_id: 1
)

Review.create(
  rating: 4,
  review_desc: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed
  do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad
      minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip
       ex ea commodo consequat. Duis aute irure dolor in reprehenderit in
       voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur
        sint occaecat cupidatat non proident, sunt in culpa qui officia
        deserunt mollit anim id est laborum',
  user_id: 2,
  company_id: 1
)

Review.create(
  rating: 2,
  review_desc: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed
   do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad
     minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip
      ex ea commodo consequat. Duis aute irure dolor in reprehenderit in
      voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur
       sint occaecat cupidatat non proident, sunt in culpa qui officia
       deserunt mollit anim id est laborum',
  user_id: 3,
  company_id: 1
)

Review.create(
  rating: 2,
  review_desc: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed
   do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad
     minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip
      ex ea commodo consequat. Duis aute irure dolor in reprehenderit in
      voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur
       sint occaecat cupidatat non proident, sunt in culpa qui officia
        deserunt mollit anim id est laborum',
  user_id: 3,
  company_id: 2
)

Review.create(
  rating: 4,
  review_desc: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed
   do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad
     minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip
      ex ea commodo consequat. Duis aute irure dolor in reprehenderit in
       voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur
        sint occaecat cupidatat non proident, sunt in culpa qui officia
         deserunt mollit anim id est laborum',
  user_id: 2,
  company_id: 2
)

Review.create(
  rating: 5,
  review_desc: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed
   do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad
     minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip
      ex ea commodo consequat. Duis aute irure dolor in reprehenderit in
      voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur
       sint occaecat cupidatat non proident, sunt in culpa qui officia
       deserunt mollit anim id est laborum',
  user_id: 1,
  company_id: 2
)
