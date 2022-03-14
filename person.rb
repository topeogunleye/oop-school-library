# Person Class
require './namable'

class Person < Namable
  # add correct_name method that returns the name attribute.
  def correct_name
    @name
  end

  attr_accessor :name, :age
  attr_reader :id

  def initialize(age,
                 name = 'Unknown',
                 parent_permission: true)
    super(name)
    @id = Random.rand(1..1000)
    @age = age
    @name = name
    @parent_permission = parent_permission
  end

  def can_use_services?
    of_age? || @parent_permission ? true : false
  end

  private

  def of_age?
    age.to_i >= 18.to_i
  end
end

# In the constructor assign a namable object from params to an instance variable.
class Decorator < Namable
  def initialize(component)
    super(component)
    @component = component
  end

  # Implement the correct_name method that returns the result of the correct_name method of the @namable
  def correct_name
    @name.correct_name
  end
end

class CapitalizeDecorator < Decorator
  def initialize(component)
    super(component)
    @component = component
  end

  # Implement a method correct_name that capitalizes the output of @nameable.correct_name
  def correct_name
    @component.correct_name.capitalize
  end
end

class TrimmerDecorator < Decorator
  def initialize(component)
    super(component)
    @component = component
  end

  # Implement a method correct_name that makes
  # sure that the output of @nameable.correct_name
  # has a maximum of 10 characters.
  def correct_name
    @component.correct_name[0..9]
  end
end
