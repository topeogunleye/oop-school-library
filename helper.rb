# helpers
def user_info
  print 'Enter the name of the person: '
  name = gets.chomp
  print 'Age: '
  age = gets.chomp
  [name, age]
end

def create_student
  name, age = user_info
  print 'Has parent permission? [Y/N]: '
  parent_permission = gets.chomp
  print 'Enter the classroom: '
  classroom = gets.chomp
  case parent_permission.upcase
  when 'Y'
    permission = true
  when 'N'
    permission = false
  else
    puts 'Invalid input'
    run
  end
  student = Student.new(classroom, age, name, parent_permission: permission)
  people_store(student)
  success('Student')
end

def create_teacher
  # destructure name and age from user info
  name, age = user_info
  puts 'Enter the specialization: '
  specialization = gets.chomp
  teacher = Teacher.new(specialization, age, name)
  people_store(teacher)
  success('Teacher')
end
