class Keys

  def rand_num_generator
    '%05d' % rand(5 ** 5)
  end

  def key_array_generator(key = nil)
    if key == nil
      num_join = rand_num_generator.chars.each_cons(2).map {|num| num.join}
      num_join.map {|num| num.to_i}
    else key != nil
      key
    end
  end
end
