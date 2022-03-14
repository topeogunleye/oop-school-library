# Person Class
class Person
  attr_accessor :name, :age
  attr_reader :id

  def initialize(age,
                 name = 'Unknown',
                 parent_permission: true)
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
