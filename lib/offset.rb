class Offset
  attr_reader :date
  def initialize (date)
    @date = date.to_i
  end

  def multiply_date
     @date * @date
  end

  def make_offset
    date_range = multiply_date.to_s.chars
    date_range[-4..-1].map {|num| num.to_i}
  end
end
