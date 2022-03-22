# frozen_string_literal: true

class Book
  attr_accessor :title, :author
  attr_reader :rentals

  def initialize(title, author)
    @title = title
    @author = author
    @rentals = []
  end

  def add_rental(book, date)
    Rental.new(date, self, book)
  end
end
