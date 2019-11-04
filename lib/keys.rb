class Keys

  def rand_num_generator
    '%05d' % rand(5 ** 5)
  end

  def key_array_generator
    num_array = rand_num_generator.chars
    num_join = num_array.each_cons(2).map {|num| num.join}
    num_join.map {|num| num.to_i}
  end
end
