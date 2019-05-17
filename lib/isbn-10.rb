class ISBN10

  attr_reader :input, :total_10, :total_13

  def initialize(input)
    @input = input
    @total_10 = 0
    @total_13 = 0
  end

  def dash_remover
    (@input.include? "-") ? @input.gsub!('-', '') : @input
  end

  def is_ten_long?
    dash_remover
    return @input.length == 10
  end

  def x_to_ten
    is_ten_long?
    @arr = @input.split("")
    @arr[-1] = "10" if @arr[-1] === "X"
    @arr
  end

  def isbn_10_calculator
    x_to_ten
    a = @arr.map!(&:to_i)
    counter = 10
    a.each do |int|
      @total_10 += int * counter
      counter -= 1
    end
    @total_10
  end

  def isbn_10_validator
    isbn_10_calculator
    @total_10 % 11 == 0 ? true : false
  end

end