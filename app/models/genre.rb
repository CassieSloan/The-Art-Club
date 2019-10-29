class Genre < ApplicationRecord
    has_many :contents_genres
    has_many :contents, through: :contents_genres
end
