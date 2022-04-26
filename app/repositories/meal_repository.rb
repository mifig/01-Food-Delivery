require "csv"
require_relative "../models/meal"
require_relative "base_repository"

class MealRepository < BaseRepository

  def convert(row)
    row[:id] = row[:id].to_i
    row[:price] = row[:price].to_i
  end

  def create_instance(row)
    Meal.new(row)
  end

  def headers
    ["id", "name", "price"]
  end

  def save_element(element)
    [element.id, element.name, element.price]
  end
end