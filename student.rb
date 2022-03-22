require './person'
# Student Class Inheriting From Person Class
class Student < Person
  attr_reader :classroom
  attr_accessor :parent_permission

  def initialize(classroom, age, name = 'Unknown', parent_permission: true)
    super(age, name, parent_permission: true)
    @classroom = classroom
    @age = age
    @name = name
    @parent_permission = parent_permission
  end

  def classroom=(classroom)
    @classroom = classroom
    classroom.student.push(self) unless classroom.student.include?(self)
  end

  def play_hooky
    "¯\(ツ)/¯"
  end
end
