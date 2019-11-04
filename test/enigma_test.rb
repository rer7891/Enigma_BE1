require './test/test_helper'
require './lib/enigma'
require './lib/keys'
require './lib/offset'
require './lib/encrypt'

class EnigmaTest < Minitest::Test

  def setup

  end

  def test_it_exists
    enigma = Enigma.new
    assert_instance_of Enigma, enigma
  end

  def test_it_can_encrypt
    date = Time.now.strftime("%d%m%y")
    enigma = Enigma.new
    offset = Offset.new(date)
    key = Keys.new
    encrypt = Encrypt.new("Im over it!", key.key_array_generator, date)
  expected = {:encryption => encrypt.encrypt_message, :key => encrypt.shift_generator, :date => date }
    assert_equal expected, enigma.encrypt("Im over it!")
  end
end
