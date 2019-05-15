class ISBN

  attr_reader :input

  def initialize(input)
    @input = input
  end

  def dash_remover
    if @input.include? '-'
      @input.gsub!('-', '')
    else
      @input
    end
  end

  def is_ten_long?
    dash_remover
    if @input.length == 10
      return true
    else
      false
    end
  end  
end