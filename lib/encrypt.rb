class Encrypt
  attr_reader :key, :offset, :encrypter

  def initialize(key, offset)
    @key = key
    @offset = offset
  end

  def create_letters
    ("a".."z").to_a #<< " "
  end

  def combine_arrays
    combined_array = @key.zip(@offset)
    combined_array.map {|num| num.sum }.flatten
  end

  def shift_generator
    @letter_array = ["A", "B", "C", "D"]
    @letter_array.zip(combine_arrays).to_h
  end

  def shift_hash
      @encrypter = {}
      @encrypter[1] = Hash[create_letters.zip(create_letters.rotate(shift_generator["A"]))]
      @encrypter[2] = Hash[create_letters.zip(create_letters.rotate(shift_generator["B"]))]
      @encrypter[3] = Hash[create_letters.zip(create_letters.rotate(shift_generator["C"]))]
      @encrypter[4]= Hash[create_letters.zip(create_letters.rotate(shift_generator["D"]))]
  end

  def encrypt_message(message)
    shift_hash
    num = 0

    message.downcase.chars.map do |letter|
      num += 1
      if create_letters.include?(letter) && num <= 4
        @encrypter[num][letter]
      elsif create_letters.include?(letter) && num > 4
        num = 1
        @encrypter[num][letter]
      else
        letter
      end
    end.join
  end
end
