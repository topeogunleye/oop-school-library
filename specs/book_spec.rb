require_relative '../book'

describe Book do
  let(:book) { Book.new('The Hobbit', 'J.R.R. Tolkien', 'Fantasy') }
  let(:person) { Person.new(20, 'John Doe') }
  let(:rental) { Rental.new(Date.today, person, book) }

  describe '#initialize' do
    it 'should set the title' do
      expect(book.title).to eq('The Hobbit')
    end

    it 'should set the author' do
      expect(book.author).to eq('J.R.R. Tolkien')
    end

    it 'should set the type' do
      expect(book.type).to eq('Fantasy')
    end

    it 'should set the rentals' do
      expect(book.rentals).to eq([])
    end
  end

  describe '#add_rental' do
    it 'should add a rental to the book' do
      book.add_rental(rental)
      expect(book.rentals).to eq([rental])
    end
  end
end