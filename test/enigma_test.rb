require './test/test_helper'
require './lib/enigma'
require './lib/keys'
require './lib/offset'
require './lib/encrypt'

class EnigmaTest < Minitest::Test

  def setup
    @keys = Keys.new
    @offset = Offset.new
    @encrypts = Encrypt.new(@keys, @offset)
    @decrypts = Decrypt.new(@keys, @offset)
    @enigma = Enigma.new(@encrypts, @decrypts)
  end

  def test_i_exists
    assert_instance_of Enigma, @enigma
  end

  def test_it_initializes
    assert_equal Encrypt, @enigma.encrypts.class
  end

  def test_it_can_encrypt
    expected = {:encryption => "lz uyru lg!", :key => [1, 12, 23, 31], :date => "011119"}
    assert_equal expected, @enigma.encrypt("Im over it!",'01231',"011119")
  end

  def test_it_can_decrypt
    expected = {:decryption => "im over it!", :key => [1, 12, 23, 31], :date => "011119"}
    assert_equal expected, @enigma.decrypt("lz uyru lg!",'01231', "011119")
  end
end
