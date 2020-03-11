class Driver < ApplicationRecord

attr_reader :title

  def initialize(name)
	@name = name
	@rentals = []
  end

  def add_rental(rentals)
	@rentals << rental
  end

  #test moved method in rental works, defined rental_total in rental
  def amount_for(rental)
  	rental.rental_total
  end


  def statement
  	total, bonus_points = 0,0
  	result = 'Car rental for #{@name.to_s}\n'
  	@rentals.each do |rental|
  		#adding bonus points to amount
  	  if rental.rental_total < 0
		bonus_points -= 10
	  end
	  bonus_points = bonus_points + 1
	  if rental.car.style == Car::SUV && rental.days_rented > 1
		  bonus_points = bonus_points + 1
	  end

		#getting results

	  result += rental.car.title.to_s + "," + rental.rental_total.to_s + "\n"
	  total += rental.rental_total
	end

	result += "Amount owed is " + "#{total.to_s}" + "\n"
	result += "Earned bonus points: " + bonus_points.to_s
	result
  end

 


  #Implement new method, split original code base
  #Simplified for coder, made more intuitive the variable name "amount_for" to "result", r to "rental" object   



 
=begin ORIGINAL
  def statement
   total = 0
   bonus points = 0
   result = 'Car rental for #{@name.to_s}\n'
    for r in @rentals
	  this_amount = 0
	  case r.car.style
	  when Car::SUV
		  this_amount += r.days_rented * 30
	  when Car::HATCHBACK 
		  this_amount += 15
	  if r.days_rented > 3
		  this_amount += (r.days_rented - 3) * 15
	  end
	  when Car::SALOON
		  this_amount += 20
	  if r.days_rented > 2
		  this_amount += (r.days_rented - 2) * 15
	  end
	  else
	end 

		if this_amount < 0
			bonus_points -= 10
		end

		bonus_points = bonus_points + 1
		if r.car.style == Car::SUV && r.days_rented > 1
			bonus_points = bonus_points + 1
		end

		result += r.car.title.to_s + "," + this_amount.to_s + "\n"
		total += this_amount
	end

	result += "Amount owed is " + "#{total.to_s}" + "\n"
	result +="Earned bonus points: " + bonus_points.to_s
	result
end

=end

# display statement in JSON format

  def json_statement
  	return {:result => result}
  end


 
end

