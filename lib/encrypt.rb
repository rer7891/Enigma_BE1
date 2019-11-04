class Encrypt
  attr_reader :shift_generator, :encrypter

  def initialize(shift_generator)
    @shift_generator = shift_generator
  end

  def create_letters
    ("a".."z").to_a #<< " "
  end



  def encrypt_message(message)
    shift_hash
    num = -1

    @message.map do |letter|
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
