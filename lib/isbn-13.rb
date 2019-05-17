require './lib/isbn-10.rb'

class ISBN13

  attr_reader :input, :total_13, :isbn10

  def initialize(input, isbn10 = ISBN10.new(input))
    @input = input
    @total_13 = 0
    @isbn10 = isbn10
  end

  def isbn_13_parser
    @isbn10.is_ten_long?
    @input.prepend("978").slice!(-1)
    @input
  end

  def isbn_13_calculator
    isbn_13_parser
    arr = @input.split("").map!(&:to_i)
    counter = 1
    arr.each do |int|
      counter % 2 == 1 ? @total_13 += int * 1 : @total_13 += int * 3
      counter += 1
    end
    @total_13
  end

  def isbn_13_generator
    isbn_13_calculator
    check_digit = 10 - (@total_13 % 10)
    @input + check_digit.to_s
  end


end