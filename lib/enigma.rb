require './lib/keys'
require './lib/offset'
require './lib/encrypter'
require './lib/decrypter'

class Enigma
  attr_reader :encrypts, :decrypts

  def initialize(encrypts, decrypts)
    @encrypts = encrypts
    @decrypts = decrypts
  end

  def encrypt(message, key = nil, date = nil)
    new_key = @encrypts.keys.rand_num_generator if key.nil? || new_key = key if key !=nil
    key = @encrypts.keys.key_array_generator(new_key) if key == nil
    date = @encrypts.offset.create_a_date if date == nil
    key = @encrypts.keys.key_array_generator(key) if key != nil

    {encryption: @encrypts.encrypt_message(message, key, date),
    key: new_key,  date: date.to_s}
  end

  def decrypt(message, key, date = @encrypts.offset.create_a_date)
    shown_key = key
    key = @encrypts.keys.key_array_generator(key)
    {decryption: @decrypts.decrypt_message(message, key, date),
    key: shown_key, date: date.to_s}
  end

end
