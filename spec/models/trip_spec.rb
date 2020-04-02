require 'rails_helper'

describe Trip, type: :model do
  describe 'validations' do
    it { should validate_presence_of :name }
    # it { should validate_presence_of :start_date }
    # it { should validate_presence_of :end_date }
  end

  describe 'relationships' do
    it {should have_many :trails}
    it {should have_many(:trails).through(:trips_trails)}
  end

  describe 'instance methods' do
    it "can calculate the total distance of all trails on the trip" do
      trip_1 = Trip.create(name:"Easter Weekend")
      trail_1 = trip_1.trails.create(name:"Rocky Point", address: 'address', length:5)
      trail_2 = trip_1.trails.create(name:"Shallow Gulf", address: 'address', length:2)
      trail_3 = trip_1.trails.create(name:"Timberline", address: 'address', length:4)

      expect(trip_1.total_distance).to eql(11)
    end

    it "can calculate the average distance of all trails on the trip" do
      trip_1 = Trip.create(name:"Easter Weekend")
      trail_1 = trip_1.trails.create(name:"Rocky Point", address: 'address', length:5)
      trail_2 = trip_1.trails.create(name:"Shallow Gulf", address: 'address', length:2)
      trail_3 = trip_1.trails.create(name:"Timberline", address: 'address', length:4)

      expect(trip_1.average_distance).to eql(3.7)
    end

    it "can identify the longest trail on the trip" do
      trip_1 = Trip.create(name:"Easter Weekend")
      trail_1 = trip_1.trails.create(name:"Rocky Point", address: 'address', length:5)
      trail_2 = trip_1.trails.create(name:"Shallow Gulf", address: 'address', length:2)
      trail_3 = trip_1.trails.create(name:"Timberline", address: 'address', length:4)

      expect(trip_1.longest_trail).to eql(trail_1)
    end
  end
end
