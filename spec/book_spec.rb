require_relative '../book'

describe Book do
  describe 'initialize the book' do
    it 'creates a new book object' do
      book = Book.new('sample book', 'jim brown')
      expect(book.title).to eq('sample book')
      expect(book.author).to eq('jim brown')
      expect(book.rentals).to eq([])
    end
  end
end
