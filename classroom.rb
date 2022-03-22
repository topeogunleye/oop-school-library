# frozen_string_literal: true

require './student'
require './person'

class Classroom
  attr_accessor :students, :label

  def initialize(label)
    @label = label
    @students = []
  end

  def add_student(student)
    @students.push(student)
    student.classroom = self
  end
end
