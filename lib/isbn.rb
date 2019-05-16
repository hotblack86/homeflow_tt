class ISBN

  attr_reader :input, :total

  def initialize(input)
    @input = input
    @total = 0
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

  def sum_calculator
    x_to_ten
    a = @arr.map!(&:to_i)
    counter = 10
    a.each do |int|
      @total += int * counter
      counter -= 1
    end
    @total
  end

  def validator
    sum_calculator
    @total % 11 == 0 ? true : false
  end

private



end