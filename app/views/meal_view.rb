class MealView
  def display(meals)
    meals.each do |meal|
      puts "#{meal.id}. #{meal.name}: #{meal.price}€"
    end
  end

  def ask_for(thing)
    puts "What's the #{thing} of the meal?"
    gets.chomp
  end
end