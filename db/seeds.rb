# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

for i in 1..30
    user = User.create(
        name: Faker::TvShows::DrWho.character,
        username: Faker::Internet.username,
        bio: Faker::TvShows::DrWho.quote,
        email: Faker::Internet.email,
        password: Faker::Internet.password(min_length: 8)
    )
    temp_user_pic = Down.download(Faker::LoremPixel.image(category:"people"))
    user.pic.attach(io:temp_user_pic, filename: File.basename(temp_user_pic.path))
    
    user.save!
    puts "created #{i} user"
end

user_ids = User.all.pluck(:id)

for i in 1..30
    genre = Genre.create(
        title: Faker::Book.genre
    )
end
    

genres = Genre.all

for i in 1..30
    medium = Medium.create(
        material: Faker::Construction.material,
    )
end

medium_ids = Medium.all.pluck(:id)

for i in 1..30
    artwork = Content.new(
        artwork: [true, false].sample, 
        price: rand(500..10000),
        title: Faker::Music.album,
        user_id: user_ids.sample,
        medium_id: medium_ids.sample

    )
    
    temp_art_pic = Down.download(Faker::LoremPixel.image(category:"abstract"))
    artwork.pic.attach(io:temp_art_pic, filename: File.basename(temp_art_pic.path))
    
    3.times do 
        artwork.genres << genres.sample
    end
    artwork.save!
    puts "created #{i} artwork"
end

