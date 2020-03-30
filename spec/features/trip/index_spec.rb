require 'rails_helper'

RSpec.describe "As a visitor on the hiking trips index page", type: :feature do
  it "I can see a list of all hiking trip names in database" do
    trip_1 = Trip.create(name:"Rocky Point")
    trip_2 = Trip.create(name:"Shallow Gulf")
    trip_3 = Trip.create(name:"Timberline")

    visit "/trips"

    within('.trip-trails-all') do
      within("#trip-trail-#{trip_1.id}") do
        expect(page).to have_content(trip_1.name)
      end
      within("#trip-trail-#{trip_2.id}") do
        expect(page).to have_content(trip_2.name)
      end
      within("#trip-trail-#{trip_3.id}") do
        expect(page).to have_content(trip_3.name)
      end
    end
  end

  it "I can click on the name of any hiking trip and be taken to that trips show page" do
    trip_1 = Trip.create(name:"Rocky Point")
    trip_2 = Trip.create(name:"Shallow Gulf")
    trip_3 = Trip.create(name:"Timberline")

    visit "/trips"

    within('.trip-trails-all') do
      within("#trip-trail-#{trip_1.id}") do
        click_link trip_1.name
      end
    end

    expect(current_path).to eql("/trips/#{trip_1.id}")

    visit "/trips"

    within('.trip-trails-all') do
      within("#trip-trail-#{trip_2.id}") do
        click_link trip_2.name
      end
    end

    expect(current_path).to eql("/trips/#{trip_2.id}")
  end
end
