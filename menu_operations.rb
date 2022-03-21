# Menu Operations
def list_books
  @books_arr.each do |book|
    puts "Title: #{book.title}, Author: #{book.author}"
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
  puts 'Select a book from the following list by number'
  @books_arr.each_with_index { |book, index| puts "#{index} Title: #{book.title}, Author: #{book.author}" }
  book_index = gets.chomp.to_i
  puts 'Select a person from the following list by number (not id)'
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
    rentals.each { |rentl| puts "Date: #{rentl.date}, Book #{rentl.book.title} by #{rentl.book.author}" }
  end
  run
end

def exit
  puts 'Goodbye'
end
