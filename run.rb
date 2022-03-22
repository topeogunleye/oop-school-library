# frozen_string_literal: true

require './book'
require './person'
require './student'
require './rental'
require './teacher'
require './store'
require './helper'
require './menu_operations'

def menu
  puts 'Select an option: '
  puts '1 - List books', '2 - List people', '3 - Create person', '4 - Create book', '5 - Create rental',
       '6 - List rentals by person_id', '7 - exit'
end

def menu_list(num)
  case num
  when 1
    Menu_Operations.list_books
  when 2
    Menu_Operations.list_people
  when 3
    Menu_Operations.create_person
  when 4
    Menu_Operations.create_book
  when 5
    Menu_Operations.create_rental
  when 6
    Menu_Operations.list_rentals_by_person_id
  when 7
    Menu_Operations.exit
  end
end

def run
  menu
  option = gets.chomp.to_i
  if option.positive? && option < 9
    menu_list(option)
  else
    puts 'Invalid input'
    run
  end
end
