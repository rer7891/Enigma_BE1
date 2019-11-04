require './test/test_helper'
require './lib/encrypt'

class EncryptTest < MiniTest::Test

  def setup
    @key = [1, 12, 23, 31]
    @offset = [2 , 1, 6, 1]
    @message = "Im over it!"
    @encrypt = Encrypt.new(@message, @key, @offset)
  end

  def test_it_exists
    assert_instance_of Encrypt, @encrypt
  end

  def test_it_initializes
    expected = ["i", "m", " ", "o", "v", "e", "r", " ", "i", "t", "!"]
    assert_equal expected, @encrypt.message
    assert_equal [1, 12, 23, 31], @encrypt.key
    assert_equal [2, 1, 6, 1], @encrypt.offset
  end

  def test_it_creates_an_alphabet
    expected = ["a","b","c","d","e","f","g","h","i","j","k","l","m",
    "n","o","p","q","r","s","t","u","v","w","x","y","z"]
    assert_equal expected, @encrypt.create_letters
  end

  def test_it_can_combine_arrays
    assert_equal [3, 13, 29, 32], @encrypt.combine_arrays
  end

  def test_it_can_assign_keys
    expected = {"A"=>3, "B"=>13, "C"=>29, "D"=>32}
    assert_equal expected, @encrypt.shift_generator
  end

  def test_it_can_encrypt_a_message
    assert_equal "lz uyru lg!", @encrypt.encrypt_message
  end

  def test_encryption_keys
    expected = {"a"=>"g", "b"=>"h", "c"=>"i", "d"=>"j", "e"=>"k", "f"=>"l", "g"=>"m", "h"=>"n", "i"=>"o", "j"=>"p", "k"=>"q",
    "l"=>"r", "m"=>"s", "n"=>"t", "o"=>"u", "p"=>"v", "q"=>"w", "r"=>"x", "s"=>"y", "t"=>"z", "u"=>"a",
    "v"=>"b", "w"=>"c", "x"=>"d", "y"=>"e", "z"=>"f"}
    @encrypt.shift_hash
    assert_equal [0, 1, 2, 3], @encrypt.encrypter.keys
    assert_equal expected, @encrypt.encrypter[3]
  end
end
