require './book'
require './person'
require './student'
require './rental'
require './teacher'
require './helper'
require './operations'

def exit
  puts 'Goodbye'
end

def menu
  puts 'Select an option: '
  puts '1 - List books', '2 - List people', '3 - Create person', '4 - Create book', '5 - Create rental',
       '6 - List rentals by person_id', '7 - exit'
end

def menu_list(num)
  case num
  when 1
    Operations.list_books
  when 2
    Operations.list_people
  when 3
    Operations.create_person
  when 4
    Operations.create_book
  when 5
    Operations.create_rental
  when 6
    Operations.list_rentals_by_person_id
  end
end

def run
  menu
  option = gets.chomp.to_i
  if option.positive? && option < 9 && option != 7
    menu_list(option)
  elsif option == 7
    exit
  else
    puts 'Invalid input'
    run
  end
end
