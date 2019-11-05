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

# for i in 1..30
#     genre = Genre.create(
#         title: Faker::Book.genre
#     )
# end


# genres = Genre.all

genres = [
    { title: "Contemporary" },
    { title: "Pop Art" },
    { title: "Abstract" },
    { title: "Expressionism" },
    { title: "Cubism" },
    { title: "Art Deco" },
    { title: "Art Neouveau" },
    { title: "Romance" },
    { title: "Impresisonism" },
    { title: "Surrealism" },
    { title: "Political" },
    { title: "Botanical" },
    { title: "Portrait" },
    { title: "Landscape" },
    { title: "Realism" },
    { title: "Manga" },
    { title: "Comic" },
    { title: "Adult" },
    { title: "Baroque" },
    { title: "Fan Art" },
    { title: "Craft" },
    { title: "Cartoon" },
    { title: "Architechture" },
    { title: "Religious" },
    { title: "Tribal" },
    { title: "Historical" },
    { title: "LGBT" },
    { title: "Other" },
    { title: "Industrial" },
    { title: "Pop Culture" },
    { title: "Decorative" }
]

if Genre.count == 0 
    for genre in genres
        new_genre = Genre.create(genre)
        puts "created genre #{genre[:title]}"
    end
end

# for i in 1..30
#     medium = Medium.create(
#         material: Faker::Construction.material,
#     )
# end

mediums = [
    { material: "Drawing" },
    { material: "Pastel" },
    { material: "Sculpture" },
    { material: "Chalk" },
    { material: "Pencil" },
    { material: "Marker" },
    { material: "Pen" },
    { material: "Watercolour" },
    { material: "Painting" },
    { material: "Mixed Media" },
    { material: "Print" },
    { material: "Ink" },
    { material: "Oil Paint" },
    { material: "Digital" },
    { material: "Gouache" },
    { material: "Acrylic" },
    { material: "Graphite" },
    { material: "Airbrush" },
    { material: "Textile" },
    { material: "Glass" },
    { material: "Ceramic" },
    { material: "Etching" },
    { material: "Lithography" },
    { material: "Electronics" },
    { material: "Carpentry" },
    { material: "Photography" },
    { material: "Fresco" },
    { material: "Fine Art" },
    { material: "Found Items" },
    { material: "Plastic" },
    { material: "Other" }
]

if Medium.count == 0 
    for medium in mediums
        new_medium = Medium.create(medium)
        puts "created medium #{medium[:material]}"
    end
end

medium_ids = Medium.all.pluck(:id)
genres = Genre.all

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

