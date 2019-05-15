class ISBN

  attr_reader :input

  def initialize(input)
    @input = input
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
end