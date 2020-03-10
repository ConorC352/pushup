class Rental < ApplicationRecord


	attr_reader :car, :days_rented

	def initialize(car, days_rented)
		@car = car
		@days_rented = days_rented

		if !(@days_rented > 0)
	raise 'Error: days_rented invalid'
	end

# Moved method from driver to rental object, defined as rental_total
	def rental_total
		result = 0
  	case rental.car.style
  	when Car::SUV
  		result += rental.days_rented * 30
  	when Car::HATCHBACK
  		result += 15
  		if rental.days_rented > 3
  			result += (rental.days_rented - 3) * 15
  		end
  	when Car::SALOON
  		result += 20
  		if rental.days_rented > 2
  			result += (rental.days_rented - 2) * 15
  		end
  	end
  end


