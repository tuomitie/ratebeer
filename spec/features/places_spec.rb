require 'rails_helper'

describe "Places" do
  it "if one is returned by the API, it is shown on the page" do
    allow(BeermappingApi).to receive(:places_in).with("kumpula").and_return(
        [ Place.new( name:"Oljenkorsi", id: 1 ) ]
    )

    visit places_path
    fill_in('city', with: 'kumpula')
    click_button "Search"

    expect(page).to have_content "Oljenkorsi"
  end

  it "if several places are returned, they are all shown" do
    allow(BeermappingApi).to receive(:places_in).with("kumpula").and_return(
        [ Place.new( name:"Oljenkorsi", id: 1 ), Place.new( name:"Korsonolki", id: 2 ), Place.new( name:"Soljenorsi", id: 3 )  ]
    )

    visit places_path
    fill_in('city', with: 'kumpula')
    click_button "Search"

    expect(page).to have_content "Oljenkorsi"
    expect(page).to have_content "Korsonolki"
    expect(page).to have_content "Soljenorsi"
  end

  it "if no places are returned, a notification is shown" do
    allow(BeermappingApi).to receive(:places_in).with("kumpula").and_return(
        [  ]
    )
    visit places_path
    fill_in('city', with: 'kumpula')
    click_button "Search"

    expect(page).to have_content "No locations in kumpula"
  end
end