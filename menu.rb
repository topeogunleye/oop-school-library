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

@menu_hash = {
  1 => method(:list_books), 2 => method(:list_people), 3 => method(:create_person),
  4 => method(:create_book), 5 => method(:create_rental),
  6 => method(:list_rentals_by_person_id), 7 => method(:exit)
}
