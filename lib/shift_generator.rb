class ShiftGenerator
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

  def rand_num_generator
    '%05d' % rand(5 ** 5)
  end

  def key_array_generator
    num_array = rand_num_generator.chars
    num_join = num_array.each_cons(2).map {|num| num.join}
    num_join.map {|num| num.to_i}
  end

  def combine_arrays
    combined_array = @key.zip(@key.make_offset)
    combined_array.map {|num| num.sum }.flatten
  end

  def shift_generator
    key_array = ["A", "B", "C", "D"]
    key_array.zip(combine_arrays).to_h
  end

  def shift_hash
      key_array = [0, 1, 2, 3]
      @encrypter = key_array.reduce({}) do |encrypter, num|
        encrypter[num] = Hash[create_letters.zip(create_letters.rotate(combine_arrays[num]))]
        encrypter
      end
  end
end
