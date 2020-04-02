require 'rails_helper'

  describe TripsTrail, type: :model do
    describe "validations" do

    end

    describe "relationships" do
      it {should belong_to :trail}
      it {should belong_to :trip}
    end

    describe 'instance methods' do
      it "text" do

      end
    end
  end
