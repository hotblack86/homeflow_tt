require 'isbn.rb'

RSpec.describe ISBN do

  it 'Returns the string' do
    # Simple first test to check that my testing framework is
    # working correctly and that I can return input as output.
    # Will remove this test and 'echo' method before completion.
      
    isbn = ISBN.new
    expect(isbn.echo('3-598-21508-8')).to eq('3-598-21508-8')
  end

  it 'Removes any dashes from the string' do
    isbn = ISBN.new
    expect(isbn.dash_remover('3-598-21508-8')).to eq('3598215088')
  end

end