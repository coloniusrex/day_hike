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
        expect(page).to have_content(trail_1.name)
      end
      within("#trail-#{trail_2.id}") do
        expect(page).to have_content(trail_2.name)
      end
      within("#trail-#{trail_3.id}") do
        expect(page).to have_content(trail_3.name)
      end
    end
  end

  it "I can see the total hiking distance of all trails on that trip" do
    trip_1 = Trip.create(name:"Easter Weekend")
    trail_1 = trip_1.trails.create(name:"Rocky Point", address: 'address', length:4)
    trail_2 = trip_1.trails.create(name:"Shallow Gulf", address: 'address', length:4)
    trail_3 = trip_1.trails.create(name:"Timberline", address: 'address', length:4)
    trip_distance = trail_1.length + trail_2.length + trail_3.length

    visit "/trips/#{trip_1.id}"

    within('.total-distance-counter')do
      expect(page).to have_content("Total trip distance: #{trip_distance}")
    end
  end
end
