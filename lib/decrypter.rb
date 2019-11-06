require_relative 'shift_module'

class Decrypter

  include ShiftModule
  attr_reader :keys, :offset, :encrypter

  def initialize(keys, offset)
    @keys = keys
    @offset = offset
  end

  def decrypt_message(message, key, date)
    shift_hash(key, date)
    num = -1

    message.downcase.chars.map do |letter|
      num += 1
      if create_letters.include?(letter) && num <= 3
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
