require 'isbn.rb'

RSpec.describe ISBN do

  it 'Returns the string' do
    # Simple first test to check that my testing framework is
    # working correctly and that I can return input.
      
    isbn = ISBN.new('3-598-21508-8')
    expect(isbn.input).to eq('3-598-21508-8')
  end

  it 'Removes any dashes from the string' do
    isbn = ISBN.new('3-598-21508-8')
    isbn2 = ISBN.new('3598215088')
    expect(isbn.dash_remover).to eq('3598215088')
    expect(isbn2.dash_remover).to eq('3598215088')
  end

  it 'Checks that the string length is 10' do
    isbn = ISBN.new('3-598-21508-8')
    isbn3 = ISBN.new('3-598-21508-83-5')
    expect(isbn.is_ten_long?).to eq(true)
    expect(isbn3.is_ten_long?).to eq(false)
  end

  it 'Converts checked string to array' do
    isbn = ISBN.new('3-598-21508-8')
    expect(isbn.convert).to eq(["3", "5", "9", "8", "2", "1", "5", "0", "8", "8"])
  end
end