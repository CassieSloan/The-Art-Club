class Content < ApplicationRecord
  belongs_to :medium
  belongs_to :user
  has_many :contents_genres
  has_many :genres, through: :contents_genres
  has_one_attached :pic

end
