class Encrypt
  attr_reader :keys, :offset, :encrypter

  def initialize(keys, offset)
    @keys = keys
    @offset = offset
  end

  def create_letters
    ("a".."z").to_a
  end

  def combine_arrays(key, date)
    new_offset = @offset.make_offset(date)
    combined_array = key.zip(new_offset)
    combined_array.map {|num| num.sum }.flatten
  end

  def shift_generator(key, date)
    key_array = ["A", "B", "C", "D"]
    key_array.zip(combine_arrays(key, date)).to_h
  end

  def shift_hash(key, date)
      new_shift = combine_arrays(key, date)
      key_array = [0, 1, 2, 3]
      @encrypter = key_array.reduce({}) do |encrypter, num|
        encrypter[num] = Hash[create_letters.zip(create_letters.rotate(new_shift[num]))]
        encrypter
      end
  end

  def encrypt_message(message, key, date)
    shift_hash(key, date)
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
