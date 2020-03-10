class Driver < ApplicationRecord

attr_reader :title

  def initialize(name)
	@name = name
	@rentals = []
  end

  def add_rental(rentals)
	@rentals << rental
  end


  def statement
  	total, bonus points = 0,0
  	result = 'Car rental for #{@name.to_s}\n'
  	@rentals.each do |rental|
  		this_amount = amount_for(rental)
  		#adding bonus points to amount
  		if this_amount < 0
			bonus_points -= 10
		end
        # changed r to rental
		bonus_points = bonus_points + 1
		if rental.car.style == Car::SUV && rental.days_rented > 1
			bonus_points = bonus_points + 1
		end

		#getting results

		result += rental.car.title.to_s + "," + this_amount.to_s + "\n"
		total += this_amount
	end

	result += "Amount owed is " + "#{total.to_s}" + "\n"
	result +="Earned bonus points: " + bonus_points.to_s
	result
  end


 



  #Implement new method
  #Simplify variable name "amount_for" to "result", r to "rental"

  def amount_for(rental)
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

