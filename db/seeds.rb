require 'faker'
require 'database_cleaner'

DatabaseCleaner.clean_with(:truncation)

10_000.times { User.create(name: Faker::Name.name) }

Post.create(title: 'Hello World!')
