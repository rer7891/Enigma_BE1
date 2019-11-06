require_relative 'shift_module'

class Encrypter

  include ShiftModule
  attr_reader :keys, :offset, :encrypter

  def initialize(keys, offset)
    @keys = keys
    @offset = offset
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
