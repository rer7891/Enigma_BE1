class Offset
  attr_reader :date

  def create_a_date
    Time.now.strftime("%d%m%y")
  end

  def multiply_date
    create_a_date.to_i * create_a_date.to_i
  end

  def make_offset
    date_range = multiply_date.to_s.chars
    date_range[-4..-1].map {|num| num.to_i}
  end
end
