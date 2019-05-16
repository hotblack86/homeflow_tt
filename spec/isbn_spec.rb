require 'isbn.rb'

RSpec.describe ISBN do

  let(:isbn_10) { ISBN.new('3598215088') }
  let(:isbn_10_dashed) { ISBN.new('3-598-21508-8') }
  let(:isbn_10_X) { ISBN.new('3-598-21508-X') }
  let(:isbn_12_dashed) { ISBN.new('3-598-21508-83-5') }

  
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

  it 'Calculates the total for ISBN number with no X' do
    expect(isbn_10_dashed.sum_calculator).to eq(264)
  end

  it 'Calculates the total for ISBN number with an X' do
    expect(isbn_10_X.sum_calculator).to eq(266)
  end  

  it 'Returns true for Valid ISBN number' do
    expect(isbn_10_dashed.validator).to eq(true)
  end

  it 'Returns false for invalid ISBN number' do
    expect(isbn_12_dashed.validator).to eq(false)
    expect(isbn_10_X.validator).to eq(false)
  end

end