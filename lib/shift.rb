class Shift

  def rand_num_generator
    '%05d' % rand(5 ** 5)
  end

  def array_generator
    num_array = rand_num_generator.chars
    num_join = num_array.each_cons(2).map {|x| x}
    num_join.map { |num| num.join}
  end

  def key_generator
    letter_array = ["A", "B", "C", "D"]
    letter_array.reduce({}) do |key_holder, letter|
      key_holder[letter] = "0"
      key_holder
    end
  end

  def value_assigner
    num = -1
    final_key_hash = {}
    key_generator.each do |key, value|
      value = array_generator[num += 1]
      final_key_hash[key] = value
    end
    final_key_hash
  end
end
