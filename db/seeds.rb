# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
for i in 1..30
    artwork = Content.create(
        price: rand(500..10000),
        title: Faker::Music.album,
    )
end

for i in 1..30
    user = User.create(
        name: Faker::TvShows::DrWho.character,
        username: Faker::Internet.username,
        bio: Faker::TvShows::DrWho.quote,
        email: Faker::Internet.email,
        password: Faker::Internet.password(min_length: 8)
    )
end

for i in 1..30
    genre = Genre.create(
        title: Faker::Book.genre
    )
end

for i in 1..30
    medium = Medium.create(
        material: Faker::Construction.material,
    )
end