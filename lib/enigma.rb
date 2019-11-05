require './lib/keys'
require './lib/offset'
require './lib/encrypt'

class Enigma
  attr_reader :encrypts

  def initialize(encrypts)
    @encrypts = encrypts
  end


  def encrypt(message, key = nil, date = nil)
    key = @encrypts.keys.key_array_generator if key == nil
    date = @encrypts.offset.create_a_date if date == nil
    key = @encrypts.keys.key_array_generator(key) if key != nil

    {encryption: @encrypts.encrypt_message(message, key, date),
    key: key,  date: date.to_s}
  end

end
