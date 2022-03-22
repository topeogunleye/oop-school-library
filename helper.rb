require './operations'

# helpers
class Helper
  def self.user_info
    print 'Enter the name of the person: '
    name = gets.chomp
    print 'Age: '
    age = gets.chomp
    [name, age]
  end

  def self.create_student
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
    student.parent_permission = permission
    Operations.push(student)
    success('Student')
  end

  def self.create_teacher
    # destructure name and age from user info
    name, age = user_info
    puts 'Enter the specialization: '
    specialization = gets.chomp
    teacher = Teacher.new(specialization, age, name)
    teacher.specialization = specialization
    Operations.push(teacher)
    success('Teacher')
  end

  def self.create_file_if_not_exist(file)
    File.open(file, 'w') unless File.exist?(file)
    File.write(file, '[]')
  end

  def self.read_convert(filename)
    JSON.parse(File.read(filename))
  end

  def self.success(message)
    puts "Successfully created #{message}"
  end
end
