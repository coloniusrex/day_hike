require 'rails_helper'

RSpec.describe "As a visitor on the Trail Show page", type: :feature do
  it "I can see the name and address of the trail" do
    trip_1 = Trip.create(name:"Easter Weekend")
    trail_1 = trip_1.trails.create(name:"Rocky Point", address: 'address', length:4)
    trail_2 = trip_1.trails.create(name:"Shallow Gulf", address: 'address', length:4)

    visit "/trails/#{trail_1.id}"

    within('.trail-info') do
      expect(page).to have_content("Trail Name: #{trail_1.name}")
      expect(page).to have_content("Address: #{trail_1.address}")
    end
  end

  it "I can see the name and total length for every trip that includes this trail" do
    trip_1 = Trip.create(name:"Easter Weekend")
    trail_1 = trip_1.trails.create(name:"Rocky Point", address: 'address', length:4)
    trail_2 = trip_1.trails.create(name:"Shallow Gulf", address: 'address', length:4)

    trip_2 = Trip.create(name:"Easter Weekend")
    trail_1 = trip_2.trails.create(name:"Rocky Point", address: 'address', length:4)
    trail_2 = trip_2.trails.create(name:"Shallow Gulf", address: 'address', length:4)

    trip_3 = Trip.create(name:"Easter Weekend")
    trail_1 = trip_3.trails.create(name:"Rocky Point", address: 'address', length:4)
    trail_3 = trip_3.trails.create(name:"Timber Ridge", address: 'address', length:4)

    visit "/trails/#{trail_1.id}"

    within('.connected-trips') do
      expect(page).to have_content("#{trip_1.name}, #{trip_1.total_distance}")
      expect(page).to have_content("#{trip_2.name}, #{trip_2.total_distance}")
      expect(page).to have_content("#{trip_3.name}, #{trip_3.total_distance}")
    end

    visit "/trails/#{trail_2.id}"

    within('.connected-trips') do
      expect(page).to have_content("#{trip_1.name}, #{trip_1.total_distance}")
      expect(page).to have_content("#{trip_2.name}, #{trip_2.total_distance}")
      expect(page).to have_no_css("#connected-trip-#{trip_3.id}")
    end

    visit "/trails/#{trail_3.id}"

    within('.connected-trips') do
      expect(page).to have_no_css("#connected-trip-#{trip_1.id}")
      expect(page).to have_no_css("#connected-trip-#{trip_2.id}")
      expect(page).to have_content("#{trip_3.name}, #{trip_3.total_distance}")
    end
  end

  it "I can see the total number of connected trips for this trail" do
    trip_1 = Trip.create(name:"Easter Weekend")
    trail_1 = trip_1.trails.create(name:"Rocky Point", address: 'address', length:4)
    trail_2 = trip_1.trails.create(name:"Shallow Gulf", address: 'address', length:4)

    trip_2 = Trip.create(name:"Easter Weekend")
    trail_1 = trip_2.trails.create(name:"Rocky Point", address: 'address', length:4)
    trail_2 = trip_2.trails.create(name:"Shallow Gulf", address: 'address', length:4)

    trip_3 = Trip.create(name:"Easter Weekend")
    trail_1 = trip_3.trails.create(name:"Rocky Point", address: 'address', length:4)
    trail_3 = trip_3.trails.create(name:"Timber Ridge", address: 'address', length:4)

    visit "/trails/#{trail_1.id}"

    within('.connected-trips') do
      within('.connected-trip-counter') do
        expect(page).to have_content("Total: #{trail_1.trips.length}")
      end
    end
  end
end
