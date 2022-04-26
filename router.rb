# TODO: implement the router of your app.
class Router
  def initialize(meals_controller, customers_controller)
    @running = true
    @meals_controller = meals_controller
    @customers_controller = customers_controller
  end

  def run
    puts "----------------------------------"
    puts "    Welcome to the Restaurant!    "
    puts "                                  "
    puts "     What do you want to do?      "
    puts "----------------------------------"

    while @running
      display_user_actions
      user_action = gets.chomp.to_i
      print `clear`
      route_action(user_action)
    end
  end

  private

  def display_user_actions
    puts "1 - List all meals"
    puts "2 - Add a new meal"
    puts "3 - List all customers"
    puts "4 - Add a new customer"
    puts "5 - Exit the restaurant"
  end

  def route_action(user_action)
    case user_action
    when 1 then @meals_controller.list
    when 2 then @meals_controller.add
    when 3 then @customers_controller.list
    when 4 then @customers_controller.add
    when 5 then stop
    else puts "Please insert a valid option"
    end
  end

  def stop
    @running = false
  end
end
