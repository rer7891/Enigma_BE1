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
    date_range = multiply_date.to_s
    date_range[-4..-1].to_i.digits
  end

  def combine_arrays
    combined_array = key_array_generator.zip(make_offset)
    combined_array.map {|num| num.sum }.flatten
  end

  def shift_generator
    letter_array = ["A", "B", "C", "D"]
    letter_array.zip(combine_arrays).to_h
  end
end
