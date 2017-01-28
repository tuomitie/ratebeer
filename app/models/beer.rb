class Beer < ActiveRecord::Base
    belongs_to :brewery
    has_many :ratings

    def average_rating
      ratings.inject(0.0) { |result, rating| result + rating.score } / ratings.size
    end

end
