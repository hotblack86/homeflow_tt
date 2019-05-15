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
  
  def convert
    is_ten_long?
    @input.split("")
  end

  def sum_calculator
    arr = convert.map!(&:to_i)
    counter = 10
    arr.each do |int|
      @total += (int * counter)
      counter -= 1
    end
    @total
  end
end