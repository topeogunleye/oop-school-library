# frozen_string_literal: true

# In the constructor assign a namable object from params to an instance variable.
require './namable'

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
