class Rating < ActiveRecord::Base
  belongs_to :beer, optional: true
  belongs_to :user # rating kuuluu myös käyttäjään

  validates :score, numericality: { greater_than_or_equal_to: 1,
                                    less_than_or_equal_to: 50,
                                    only_integer: true }

  scope :recent, -> { Rating.last(3) }

  def to_s
    "#{beer.name} #{self.score}"
  end
end
