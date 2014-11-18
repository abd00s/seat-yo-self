require 'rails_helper'

describe Restaurant do
  describe "#available?" do 
    let(:time) {DateTime.new(2014,11,25,17,0)}
    let(:restaurant) {Restaurant.create(name: "Canoe", capacity: 100)}

    it "should return true if there's space available" do
      expect(restaurant.available?(10,time)).to be(true)
    end

    it "should return false if there's no space available" do
      expect(restaurant.available?(200, time)).to be(false)
    end
    
    it "should return true if there's exactly the capacity of the restaurant" do
      expect(restaurant.available?(100, time)).to be(true)
    end

    context "with one existing reservation" do
      let!(:reservation) { Reservation.create(:restaurant => restaurant, :time => time, :size => 10)}

      it "should return true if there's space available" do
        expect(restaurant.available?(10, time)).to be(true)
      end

      it "should return false if there's no space available" do
        expect(restaurant.available?(99, time)).to be(false)
      end

      # it "should return true if the reservation is for a different time" do
      #   expect(restaurant.available?(99, start_time + 1.hour)).to be(true)
      # end
    end    
  end
end