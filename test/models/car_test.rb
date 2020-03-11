require 'test_helper'

class CarTest < ActiveSupport::TestCase

  test 'title must be present' do
    car = Car.new(title: '')
    car.valid?
    assert_includes car.errors.messages[:title], "can't be blank"
  end


  test 'style must be present' do
    car = Car.new(style: '')
    car.valid?
    assert_includes car.errors.messages[:style], "can't be blank"
  end

  #test 'valid car' do
   #car = Car.new(title: 'SALOON', style: '1')
   #assert car.valid?
  #end

 

  #test "should not save car without title" do
  #car = Car.new
  #assert_not car.save, "Saved the car without a title"

end

# test/models/user_test.rb
