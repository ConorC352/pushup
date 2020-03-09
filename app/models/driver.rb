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


  def to_json(*a)
    {
      'json_class'   => self.class.statement,
      'data'         => [ bonus_points, exclude_end? ]
    }.to_json(*a)
  end

  def self.json_create(o)
    new(*o['data'])
  end

end

