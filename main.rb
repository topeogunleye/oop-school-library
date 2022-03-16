require './book'
require './person'
require './student'
require './rental'
require './teacher'

@books_arr = []
@people_arr = []
@rentals_arr = []

def book_store(book)
  @books_arr.push(book)
  @books_arr
end

def people_store(person)
  @people_arr.push(person)
  @people_arr
end

def rentals_store(rental)
  @rentals_arr.push(rental)
  @rentals_arr
end

def success(message)
  puts "Successfully created #{message}"
end

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

# Menu Operations

def list_books
  @books_arr.each do |book|
    puts "#{book} Name: #{book.title} by #{book.author}"
  end
  run
end

def list_people
  @people_arr.each { |person| puts "[#{person.class}]: Name: #{person.name}, ID: #{person.id} AGE: #{person.age}" }
  run
end

def create_person
  puts 'Student (1) or Teacher (2)? [Enter a number]'
  option = gets.chomp
  case option.to_i
  when 1
    create_student
  when 2
    create_teacher
  else puts 'Invalid input'
  end
  run
end

def create_book
  puts 'Title: '
  title = gets.chomp
  puts 'Author: '
  author = gets.chomp
  book = Book.new(title, author)
  book_store(book)
  success('Book')
  run
end

def create_rental
  puts 'Select a book to rent [Enter a number]: '
  @books_arr.each_with_index { |book, index| puts "#{index} - #{book.title}" }
  book_index = gets.chomp.to_i
  puts 'Select a person to rent [Enter a number]: '
  @people_arr.each_with_index do |person, index|
    puts "#{index} [#{person.class}]: Name: #{person.name}, ID: #{person.id} AGE: #{person.age}"
  end
  person_index = gets.chomp.to_i
  print 'Enter the date [YYYY-MM-DD]: '
  date = gets.chomp
  book = @books_arr[book_index]
  person = @people_arr[person_index]
  rental = Rental.new(date, person, book)
  rentals_store(rental)
  success('Rental')
  run
end

def list_rentals_by_person_id
  puts 'Enter a person id: '
  @people_arr.each { |person| puts "#{person.name} - Person ID: #{person.id}" }
  person_id = gets.chomp.to_i
  rentals = @rentals_arr.select { |rental| rental.person.id == person_id }

  if rentals.empty?
    puts "Person with ID #{person_id} has no rentals yet"
  else
    rentals.each { |rentl| puts "#{rentl.date} - #{rentl.book.title}" }
  end
  run
end

def exit
  puts 'Goodbye'
end

def menu
  puts 'Select an option: '
  puts '1 - List books', '2 - List people', '3 - Create person', '4 - Create book', '5 - Create rental',
       '6 - List rentals by person_id', '7 - exit'
end

@menu_hash = {
  1 => method(:list_books), 2 => method(:list_people), 3 => method(:create_person),
  4 => method(:create_book), 5 => method(:create_rental),
  6 => method(:list_rentals_by_person_id), 7 => method(:exit)
}

def run
  menu
  option = gets.chomp.to_i
  if option.positive? && option < 9
    @menu_hash[option].call
  else
    puts 'Invalid input'
    run
  end
end

run
