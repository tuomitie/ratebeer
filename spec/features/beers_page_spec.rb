require 'rails_helper'

include Helpers

describe "Beer" do
  let!(:brewery) { FactoryGirl.create :brewery, name: "Koff" }
  let!(:user) { FactoryGirl.create :user }

  before :each do
    sign_in(username: "Pekka", password: "Foobar1")
  end

  it "when name is filled, a beer is added" do
    visit new_beer_path
    fill_in('beer_name', with: 'Brianov pivo')
    expect {
      click_button('Create Beer')
    }.to change { Beer.count }.by(1)
  end

  it "can't save a beer without a name" do
    visit new_beer_path
    click_button('Create Beer')
    expect(page).to have_content '1 error prohibited this beer from being saved'
  end
end