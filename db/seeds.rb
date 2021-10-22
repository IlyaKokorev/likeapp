require 'faker'
require 'database_cleaner'

DatabaseCleaner.clean_with(:truncation)

10_000.times { User.create(name: Faker::Name.name) }

Post.create(title: 'Hello World!')
Counter.create(id: 1, count: 0,
               created_at: '2021-10-22 13:32:06.140531'.to_datetime,
               updated_at: '2021-10-22 13:32:06.140531'.to_datetime)
