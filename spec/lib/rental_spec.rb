require "spec_helper"
require "rental"


describe Rental do
  describe '#statement' do
    it 'returns "result"' do
  		rental = Renter.new
  		expect(rental).to eql('')
    end	
end
end
