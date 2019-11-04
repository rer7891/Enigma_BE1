require './lib/keys'
require './lib/offset'
require './lib/encrypt'

class Enigma
  def initialize(encrypt)
    @encrypt = encrypt
  end

  def encrypt(message, key = nil, date = nil)
  @keys.key_array_generator if key == nil || @date if date == nil

    {encryption: encrypts.encrypt_message,
    key: encrypts.shift_generator,
    date: date}
  end

end
