require 'isbn-13.rb'

RSpec.describe ISBN13 do

  let(:isbn_13) { ISBN13.new('1861972717') }
  let(:isbn_13_dashed) { ISBN13.new('1-861-97271-7') }

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