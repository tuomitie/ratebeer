class BeerClub < ActiveRecord::Base
  has_many :memberships, dependent: :destroy
  has_many :members, through: :memberships, source: :user

  def to_s
    "#{name} | #{city}"
  end
end
