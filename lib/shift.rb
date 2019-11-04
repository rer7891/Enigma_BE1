class Shift

  def rand_num_generator
    '%05d' % rand(5 ** 5)
  end

  def key_array_generator
    num_array = rand_num_generator.chars
    num_join = num_array.each_cons(2).map {|num| num.join}
    num_join.map {|num| num.to_i}
  end

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
