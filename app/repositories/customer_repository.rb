require "csv"
require_relative "../models/customer"
require_relative "base_repository"

class CustomerRepository < BaseRepository

  def convert(row)
    row[:id] = row[:id].to_i
  end

  def create_instance(row)
    Customer.new(row)
  end

  def headers
    ["id", "name", "address"]
  end

  def save_element(element)
    [element.id, element.name, element.address]
  end
end