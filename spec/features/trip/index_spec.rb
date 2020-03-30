require 'rails_helper'

RSpec.describe "As a visitor on the hiking trips index page", type: :feature do
  it "I can see a list of all hiking trip names in database" do
    trip_1 = Trip.create(name:"Rocky Point")

    visit "/trips"

    within('.hike-trip-all') do
      within("#hike-trip-#{trip_1.id}") do
      expect(page).to have_content(trip_1.name)
      end
    end
  end
end
