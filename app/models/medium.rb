class Medium < ApplicationRecord
    has_many :contents_mediums
    has_many :contents, through: :contents_mediums
end
