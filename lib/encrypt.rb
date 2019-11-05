class Encrypt
  attr_reader :keys, :offset, :encrypter

  def initialize(keys, offset)
    @keys = keys
    @offset = offset
  end

  def create_letters
    ("a".."z").to_a
  end

  def combine_arrays
    combined_array = @keys.key_array_generator.zip(@offset.make_offset)
    combined_array.map {|num| num.sum }.flatten
  end

  def shift_generator
    key_array = ["A", "B", "C", "D"]
    key_array.zip(combine_arrays).to_h
  end

  def shift_hash#(key = @key, offset = @offset)
      key_array = [0, 1, 2, 3]
      @encrypter = key_array.reduce({}) do |encrypter, num|
        encrypter[num] = Hash[create_letters.zip(create_letters.rotate(combine_arrays[num]))]
        encrypter
      end
  end

  def encrypt_message(message, key = nil, date = nil)
    shift_hash
    num = -1

    message.downcase.chars.map do |letter|
      num += 1
      if create_letters.include?(letter) && num <= 3
        @encrypter[num][letter]
      elsif create_letters.include?(letter) && num > 3
        num = 0
        @encrypter[num][letter]
      else
        letter
      end
    end.join
  end
end
