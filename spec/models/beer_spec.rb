require 'rails_helper'

RSpec.describe Beer, type: :model do
  let(:brewery){ Brewery.create name:"Panimo", year:1980 }

  it "is saved with a name and a style" do
    beer =  Beer.create name:"Olut", style:"IPA"
    brewery.beers << beer
    expect(beer).to be_valid
    expect(brewery.beers.count).to eq(1)
  end

  it "is not saved without a name" do
    beer =  Beer.create style:"IPA"
    brewery.beers << beer
    expect(beer).not_to be_valid
    expect(brewery.beers.count).to eq(0)
  end

  it "is not saved without a style" do
    beer =  Beer.create name:"Olut"
    brewery.beers << beer
    expect(beer).not_to be_valid
    expect(brewery.beers.count).to eq(0)
  end
end
