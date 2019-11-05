class Offset
  attr_reader :date

  def create_a_date
    Time.now.strftime("%d%m%y")
  end

  def multiply_date(date = nil)
    if date.nil?
      create_a_date.to_i * create_a_date.to_i
    elsif date != nil
      date.to_i * date.to_i
    end
  end

  def make_offset(date = nil)
    if date != nil
      date_range = multiply_date(date).to_s.chars
    elsif date.nil?
      date_range = multiply_date.to_s.chars
    end
      date_range[-4..-1].map {|num| num.to_i}
  end
end
