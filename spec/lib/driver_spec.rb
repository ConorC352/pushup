require "spec_helper"
require 'driver'




RSpec.describe Driver do
    describe 'validations' do 
	describe name do
		it 'must be present' do
			driver = Driver.new
			expect(driver).to_not be_valid
			driver.valid?
		end
	end
end
end