require './lib/isbn_10.rb'

class ISBN13

  attr_reader :input, :total, :isbn10

  def initialize(input, isbn10 = ISBN10.new(input))
    @input = input
    @total = 0
    @isbn10 = isbn10
  end

  def isbn_13_parser
    @isbn10.dash_remover
    @input.prepend("978").slice!(-1)
    @input
  end

  def isbn_13_calculator
    isbn_13_parser
    arr = @input.split("").map!(&:to_i)
    arr.each.with_index(1) do |int, index|
      index % 2 == 1 ? @total += int * 1 : @total += int * 3
    end
    @total
  end

  def isbn_13_generator
    isbn_13_calculator
    check_digit = 10 - (@total % 10)
    @input + check_digit.to_s
  end


end