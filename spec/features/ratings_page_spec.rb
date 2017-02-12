require 'rails_helper'

include Helpers

describe "Rating" do
  let!(:brewery) { FactoryGirl.create :brewery, name: "Koff" }
  let!(:beer1) { FactoryGirl.create :beer, name: "iso 3", brewery: brewery }
  let!(:beer2) { FactoryGirl.create :beer, name: "Karhu", brewery: brewery }
  let!(:user) { FactoryGirl.create :user }

  before :each do
    sign_in(username: "Pekka", password: "Foobar1")
  end

  it "when given, is registered to the beer and user who is signed in" do
    visit new_rating_path
    select('iso 3', from: 'rating[beer_id]')
    fill_in('rating[score]', with: '15')

    expect {
      click_button "Create Rating"
    }.to change { Rating.count }.from(0).to(1)

    expect(user.ratings.count).to eq(1)
    expect(beer1.ratings.count).to eq(1)
    expect(beer1.average_rating).to eq(15.0)
  end

  it "total number of ratings is shown no the ratings page" do
    create_beers_with_ratings(user, 10, 20, 15, 7, 9)
    visit ratings_path
    expect(page).to have_content 'Number of ratings: 5'
  end

  it "only shows users own ratings on their page" do
    user2 = FactoryGirl.create :user2
    create_beers_with_ratings(user2, 1, 1, 1)

    create_beers_with_ratings(user, 5, 5)
    visit user_path(user)
    expect(page).to have_content 'Has made 2 ratings, average 5.0'
  end

  it "deleted rating is removed from the database" do
    create_beers_with_ratings(user, 5, 3)
    visit user_path(user)
    expect(page).to have_content 'Has made 2 ratings, average 4.0'
    expect{
      find('li', :text => '5').click_link('delete')
    }.to change { Rating.count }.by -1
  end
end

def create_beers_with_ratings(user, *scores)
  scores.each do |score|
    create_beer_with_rating user, score
  end
end

def create_beer_with_rating(user, score)
  beer = FactoryGirl.create(:beer)
  FactoryGirl.create(:rating, score: score, beer: beer, user: user)
  beer
end