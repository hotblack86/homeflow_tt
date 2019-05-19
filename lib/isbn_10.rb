class ISBN10

  attr_reader :input, :total

  def initialize(input)
    @input = input
    @total= 0
  end

  def dash_remover
    @input.include?("-") ? @input.gsub!('-', '') : @input
  end

  def is_ten_long?
    dash_remover
    @input.length == 10
  end

  def x_to_ten
    dash_remover
    @arr = @input.split("")
    @arr[-1] = "10" if @arr[-1] === "X"
    @arr
  end

  def isbn_10_calculator
    x_to_ten
    a = @arr.map!(&:to_i)
    a.reverse.each.with_index(1) do |int, index|
      @total += int * index
    end
    @total
  end

  def isbn_10_validator
    isbn_10_calculator
    @total % 11 == 0 ? true : false
  end

end