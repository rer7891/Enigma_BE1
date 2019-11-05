class Decrypt
  attr_reader :key, :offset, :encrypter

  def initialize(key, offset)
    @key = key
    @offset = offset
  end

  def create_letters
    ("a".."z").to_a
  end

  def combine_arrays
    combined_array = @key.zip(@offset)
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

  def decrypt_message(message)
    shift_hash
    num = -1

    message.downcase.chars.map do |letter|
      num += 1
      if create_letters.include?(letter) && num <= 3
#require "pry"; binding.pry
        @encrypter[num].key(letter)
      elsif create_letters.include?(letter) && num > 3
        num = 0
        @encrypter[num].key(letter)
      else
        letter
      end
    end.join
  end
end
