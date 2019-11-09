class Content < ApplicationRecord
  validates :title, :genre, :medium, :price, :pic, presence: true
  belongs_to :user
  has_many :contents_genres, dependent: :destroy
  has_many :genres, through: :contents_genres
  has_many :contents_mediums, dependent: :destroy
  has_many :mediums, through: :contents_mediums
  has_one_attached :pic
  has_one :order
end
