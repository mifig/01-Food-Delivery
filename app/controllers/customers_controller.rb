require_relative "../views/customer_view"

class CustomersController
  def initialize(customer_repository)
    @customer_repository = customer_repository
    @customer_view = CustomerView.new
  end

  def list
    customers = @customer_repository.all
    @customer_view.display(customers)
  end

  def add
    name = @customer_view.ask_for("name")
    address = @customer_view.ask_for("address")
    customer = Customer.new(name: name, address: address)
    @customer_repository.create(customer)
  end
end