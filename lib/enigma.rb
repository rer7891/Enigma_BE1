require './lib/shift_generator'
require './lib/encrypt'

class Enigma
  def initialize(encrypt)
    @encrypt = encrypt
  end

  def encrypt(message, key = nil, date = nil)
  @encrypt.shift_generator.key_array_generator if key == nil
  @encrypt.shift_generator.date if date == nil

    {encryption: encrypts.encrypt_message(message, key, date),
    key: encrypts.shift_generator.shift_maker,
    date: date}
  end

end
