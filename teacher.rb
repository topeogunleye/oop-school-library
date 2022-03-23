require './person'
# Teacher Class Inheriting From Person Class
class Teacher < Person
  attr_accessor :specialization

  def initialize(specialization, age, name = 'Unknown', parent_permission: true)
    super(age, name, parent_permission: true)
    @specialization = specialization
    @age = age
    @name = name
    @parent_permission = parent_permission
  end

  def can_use_services?
    true
  end
end

teacher = Teacher.new('Science', 20, 'Jon Snow', parent_permission: false)

puts teacher.can_use_services?
