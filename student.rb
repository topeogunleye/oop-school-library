require './person'
# Student Class Inheriting From Person Class
class Student < Person
  def initialize(classroom, age, name = 'Unknown', parent_permission: true)
    super(age, name, parent_permission: true)
    @classroom = classroom
    @age = age
    @name = name
    @parent_permission = parent_permission
  end

  def play_hooky
    "¯\(ツ)/¯"
  end
end

student = Student.new('Class1', 19, 'Trent', parent_permission: false)

puts student.play_hooky
puts student.name
puts student.can_use_services?
