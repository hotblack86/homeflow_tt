require 'isbn.rb'

RSpec.describe ISBN do

  let(:isbn_10) { ISBN.new('3598215088') }
  let(:isbn_10_dashed) { ISBN.new('3-598-21508-8') }
  let(:isbn_10_X) { ISBN.new('3-598-21508-X') }
  let(:isbn_12_dashed) { ISBN.new('3-598-21508-83-5') }

  let(:isbn_13) { ISBN.new('1861972717') }
  let(:isbn_13_dashed) { ISBN.new('1-861-97271-7') }

  context 'ISBN-10' do
    it 'Removes any dashes from the string' do
      expect(isbn_10_dashed.dash_remover).to eq('3598215088')
      expect(isbn_10.dash_remover).to eq('3598215088')
    end

    it 'Checks that the string length is 10' do
      expect(isbn_10_dashed.is_ten_long?).to eq(true)
      expect(isbn_12_dashed.is_ten_long?).to eq(false)
    end

    it 'Converts X to 10' do
      expect(isbn_10_X.x_to_ten).to eq(["3", "5", "9", "8", "2", "1", "5", "0", "8", "10"])
    end

    it 'Calculates the total for ISBN-10 number with no X' do
      expect(isbn_10_dashed.isbn_10_sum_calculator).to eq(264)
    end

    it 'Calculates the total for ISBN-10 number with an X' do
      expect(isbn_10_X.isbn_10_sum_calculator).to eq(266)
    end  

    it 'Returns true for Valid ISBN-10 number' do
      expect(isbn_10_dashed.isbn_10_validator).to eq(true)
    end

    it 'Returns false for invalid ISBN-10 number' do
      expect(isbn_12_dashed.isbn_10_validator).to eq(false)
      expect(isbn_10_X.isbn_10_validator).to eq(false)
    end
  end

  context 'ISBN-13' do
    it 'Prepends 978 and removes final digit of string' do
      expect(isbn_13.isbn_13_parser).to eq('978186197271')
      expect(isbn_13_dashed.isbn_13_parser).to eq('978186197271')
    end

    it 'Calculates the total for ISBN-13 number' do
      expect(isbn_13.isbn_13_calculator).to eq(118)
      expect(isbn_13_dashed.isbn_13_calculator).to eq(118)
    end

    it 'Generates a valid ISBN-13 from the input ISBN-10 with no dashes or x' do
      expect(isbn_13.isbn_13_generator).to eq('9781861972712')
      expect(isbn_13_dashed.isbn_13_generator).to eq('9781861972712')
    end
  end
end