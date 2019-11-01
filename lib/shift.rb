class Shift

  def rand_num_generator
    '%05d' % rand(5 ** 5)
  end

  def key_generator(num = rand_num_generator)
    hash = {}
    hash["A"] = num[0]
    hash["A"] += num[1]
    hash["B"] = num[1]
    hash["B"] += num[2]
    hash["C"] = num[2]
    hash["C"] += num[3]
    hash["D"] = num[3]
    hash["D"] += num[4]
    hash
    #require "pry"; binding.pry
  end
end
