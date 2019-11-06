require './test/test_helper'
require './lib/enigma'
require './lib/keys'
require './lib/offset'
require './lib/encrypter'
require './lib/decrypter'

class EnigmaTest < Minitest::Test

  def setup
    @keys = Keys.new
    @offset = Offset.new
    @encrypts = Encrypter.new(@keys, @offset)
    @decrypts = Decrypter.new(@keys, @offset)
    @enigma = Enigma.new(@encrypts, @decrypts)
  end

  def test_i_exists
    assert_instance_of Enigma, @enigma
  end

  def test_it_initializes
    assert_equal Encrypter, @enigma.encrypts.class
    assert_equal Decrypter, @enigma.decrypts.class
  end

  def test_it_can_encrypt
    expected = {:encryption => "lz uyru lg!", :key=>'01231', :date => "011119"}
    assert_equal expected, @enigma.encrypt("Im over it!",'01231',"011119")
  end

  def test_it_can_decrypt
    expected = {:decryption => "im over it!", :key=>"01231", :date => "011119"}
    assert_equal expected, @enigma.decrypt("lz uyru lg!",'01231', "011119")
  end
end
