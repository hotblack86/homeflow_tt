class ISBN

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

  def isbn_10_sum_calculator
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
    isbn_10_sum_calculator
    @total_10 % 11 == 0 ? true : false
  end




  def isbn_13_parser
    is_ten_long?
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
    check = 10 - (@total_13 % 10)
    @input + check.to_s
  end

private



end