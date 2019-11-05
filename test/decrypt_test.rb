require './test/test_helper'
require './lib/decrypt'
require './lib/keys'
require './lib/offset'

class EncryptTest < MiniTest::Test

  def setup
    @key = [1, 12, 23, 31]
    @offset = [2, 1, 6, 1]
    @message = "lz uyru lg!"
    @decrypt = Decrypt.new(@key, @offset)
  end

  def test_it_exists
    assert_instance_of Decrypt, @decrypt
  end

  def test_it_initializes
    assert_equal [1, 12, 23, 31], @decrypt.key
    assert_equal [2, 1, 6, 1], @decrypt.offset
  end

  def test_it_creates_an_alphabet
    expected = ["a","b","c","d","e","f","g","h","i","j","k","l","m",
    "n","o","p","q","r","s","t","u","v","w","x","y","z"]
    assert_equal expected, @decrypt.create_letters
  end

  def test_it_can_combine_arrays
    assert_equal [3, 13, 29, 32], @decrypt.combine_arrays
  end

  def test_it_can_assign_keys
    expected = {"A"=>3, "B"=>13, "C"=>29, "D"=>32}
    assert_equal expected, @decrypt.shift_generator
  end

  def test_it_can_decrypt_a_message
    assert_equal "im over it!", @decrypt.decrypt_message(@message)
  end

  def test_encryption_keys
    expected = {"a"=>"g", "b"=>"h", "c"=>"i", "d"=>"j", "e"=>"k", "f"=>"l", "g"=>"m", "h"=>"n", "i"=>"o", "j"=>"p", "k"=>"q",
    "l"=>"r", "m"=>"s", "n"=>"t", "o"=>"u", "p"=>"v", "q"=>"w", "r"=>"x", "s"=>"y", "t"=>"z", "u"=>"a",
    "v"=>"b", "w"=>"c", "x"=>"d", "y"=>"e", "z"=>"f"}
    @decrypt.shift_hash
    assert_equal [0, 1, 2, 3], @decrypt.encrypter.keys
    assert_equal expected, @decrypt.encrypter[3]
  end
end
