require 'pry'
class Waiter
  attr_accessor :name, :years_experience

  @@all = []

  def initialize(name, years_experience)
    @name = name
    @years_experience = years_experience
    save
  end

  def save
    @@all << self
  end

  def self.all
    @@all
  end

  def new_meal(customer, total, tip)
    Meal.new(self, customer, total, tip)
  end

  def meals
    Meal.all.select{ |meal|
      meal.waiter.name == self.name
    }
  end

  def best_tipper
    best_tip = meals.max_by { |meal| meal.tip }
    best_tip.customer
  end
end