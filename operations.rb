# Imports
require './helper'
require 'json'
require './run'

# Menu Operations
class Operations
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
      books_arr = Helper.read_convert('books.json')
      books_arr.push({ 'title' => item.title, 'author' => item.author })
      File.write('books.json', books_arr.to_json)
    end
  end

  def self.list_books
    if File.exist?('books.json')
      JSON.parse(File.read('books.json')).each do |book|
        puts "Title: #{book['title']}, Author: #{book['author']}"
      end
    else
      File.open('books.json', 'w')
      File.write('books.json', '[]')
    end
    run
  end

  def self.list_people
    if File.exist?('people.json')
      JSON.parse(File.read('people.json')).each do |person|
        puts "Type: #{person['class']}, Name: #{person['name']}, ID: #{person['id']}, Age: #{person['age']}"
      end
    else
      File.open('people.json', 'w')
      File.write('people.json', '[]')
    end
    run
  end

  def self.create_person
    puts 'Student (1) or Teacher (2)? [Enter a number]'
    option = gets.chomp
    case option.to_i
    when 1
      Helper.create_student
    when 2
      Helper.create_teacher
    else puts 'Invalid input'
    end
    run
  end

  def self.create_book
    puts 'Title: '
    title = gets.chomp
    puts 'Author: '
    author = gets.chomp
    book = Book.new(title, author)
    Operations.push(book)
    Helper.success('Book')
    run
  end

  def self.create_rental
    puts 'Select a book from the following list by number'
    books_arr.each_with_index { |book, index| puts "#{index} Title: #{book.title}, Author: #{book.author}" }
    book_index = gets.chomp.to_i
    puts 'Select a person from the following list by number (not id)'
    people_arr.each_with_index do |person, index|
      puts "#{index} [#{person.class}]: Name: #{person.name}, ID: #{person.id} AGE: #{person.age}"
    end
    person_index = gets.chomp.to_i
    print 'Enter the date [YYYY-MM-DD]: '
    date = gets.chomp
    book = @books_arr[book_index]
    person = @people_arr[person_index]
    rental = Rental.new(date, person, book)
    Operations.push(rental)
    Helper.success('Rental')
    run
  end

  def self.list_rentals_by_person_id
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
end
