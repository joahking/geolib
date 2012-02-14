require 'test_helper'

module Geolib
  describe Coord do
    describe '#to_dd' do
      it 'converts to decimal degrees' do
        Geolib::Coord.new("45 46 52").to_dd.must_equal [45.7811]
      end

      it 'accepts a truncate param' do
        Geolib::Coord.new("45 46 52").to_dd(2).must_equal [45.78]
      end
    end
  end
end
