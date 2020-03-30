require 'rails_helper'

RSpec.describe "As a visitor on the hiking trips show page", type: :feature do
  it "I see a list of trails included in the trip and name, address, length for each trail" do
    trip_1 = Trip.create(name:"Easter Weekend")
    trail_1 = trip_1.trails.create(name:"Rocky Point", address: 'address', length:4)
    trail_2 = trip_1.trails.create(name:"Shallow Gulf", address: 'address', length:4)
    trail_3 = trip_1.trails.create(name:"Timberline", address: 'address', length:4)

    visit "/trips/#{trip_1.id}"

    within('.trails-all') do
      within("#trail-#{trail_1.id}") do
        expect(page).to have_content(trip_1.name)
      end
    end
  end
end
