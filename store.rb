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
