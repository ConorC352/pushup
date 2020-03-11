class Driver

  validates :name, presence: true

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
	result +="Earned bonus points: " + bonus_points.to_s
	result
  end
end