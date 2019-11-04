require './test/test_helper'
require './lib/enigma'
require './lib/shift_generator'
require './lib/encrypt'

class EnigmaTest < Minitest::Test

  def setup
    date = Time.now.strftime("%d%m%y")
    key = [1, 34, 2, 5]
    shift_generator = ShiftGenerator.new(key, date)
    @encrypt = Encrypt.new(shift_generator)
  end

  def test_it_exists
    enigma = Enigma.new(@encrypt)
    assert_instance_of Enigma, enigma
  end

  def test_it_can_encrypt
    encrypt = Encrypt.new("Im over it!", key.key_array_generator, date)
  expected = {:encryption => encrypt.encrypt_message, :key => encrypt.shift_generator, :date => date }
    assert_equal expected, enigma.encrypt("Im over it!")
  end
end
