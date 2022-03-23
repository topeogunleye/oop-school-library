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

  def self.push(item)
    if item.is_a?(Person)
      Helper.create_file_if_not_exist('people.json')
      people_arr = Helper.read_convert('people.json')

      if item.instance_of?(Student)
        people_arr.push({ class: item.class, 'name' => item.name, 'id' => item.id, 'age' => item.age,
                          'parent_permission' => item.parent_permission, 'rentals' => item.rentals })
      else
        people_arr.push({ class: item.class, 'name' => item.name, 'id' => item.id, 'age' => item.age,
                          'specialization' => item.specialization, 'rentals' => item.rentals })
      end

      File.write('people.json', people_arr.to_json)
    else
      Helper.create_file_if_not_exist('books.json')
      books_arr = Helper.read_convert('books.json').push({ 'title' => item.title, 'author' => item.author })
      File.write('books.json', books_arr.to_json)
    end
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

  def self.create_file_if_not_exist(file_name)
    return unless File.exist?(file_name) == false

    File.open(file_name, 'w')
    File.write(file_name, '[]')
  end

  def self.read_convert(filename)
    JSON.parse(File.read(filename))
  end

  def self.success(message)
    puts "Successfully created #{message}"
  end
end
