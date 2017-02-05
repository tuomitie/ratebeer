class User < ActiveRecord::Base
  include RatingAverage

  validates :username, uniqueness: true,
            length: { minimum: 3, maximum: 30 }

  has_many :ratings   # käyttäjällä on monta ratingia
  has_many :beers, through: :ratings
end
