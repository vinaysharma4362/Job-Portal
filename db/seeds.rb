# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.create(email: 'admin@gmail.com', password: '123456')

admin = User.find_by(email: 'admin@gmail.com')
admin.add_role :admin

User.create(email: 'v@1.com', password: '123456')

Company.create(email: 'c@1.com', password: '123456')

Company.create(email: 'c@2.com', password: '123456')

JobPost.create(job_title: 'Ux designer', company_id: 1, salary_min: 10000, salary_max: 20000)

JobPost.create(job_title: 'Software developer', company_id: 2, salary_min: 10000, salary_max: 20000)

