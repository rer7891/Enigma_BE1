require './lib/keys'
require './lib/offset'
require './lib/encrypt'

class Enigma
  def initialize
    @keys = Keys.new
    @date = Time.now.strftime("%d%m%y")
    @offset = Offset.new(@date)
  end

  def encrypt(message, key = @keys.key_array_generator, date = @date)

    encrypts = Encrypt.new(message, key, date)

    {encryption: encrypts.encrypt_message,
    key: encrypts.shift_generator,
    date: date}
  end

end
