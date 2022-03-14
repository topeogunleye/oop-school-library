# Person Class
require './namable'

class Person < Namable
  # add correct_name method that returns the name attribute.
  def correct_name
    @name
  end

  attr_accessor :name, :age, :rentals
  attr_reader :id

  def initialize(age,
                 name = 'Unknown',
                 parent_permission: true)
    super(name)
    @id = Random.rand(1..1000)
    @age = age
    @name = name
    @parent_permission = parent_permission
    @rentals = []
  end

  def add_rental(book, date)
    Rental.new(date, self, book)
  end

  def can_use_services?
    of_age? || @parent_permission ? true : false
  end

  private

  def of_age?
    age.to_i >= 18.to_i
  end
end
