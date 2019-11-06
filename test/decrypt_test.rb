require './test/test_helper'
require './lib/decrypter'
require './lib/keys'
require './lib/offset'

class DecrypterTest < MiniTest::Test

  def setup
    @key = Keys.new
    @offset = Offset.new
    @message = "lz uyru lg!"
    @decrypt = Decrypter.new(@key, @offset)
  end

  def test_it_exists
    assert_instance_of Decrypter, @decrypt
  end

  def test_it_initializes
    assert_equal Keys, @decrypt.keys.class
    assert_equal Offset, @decrypt.offset.class
  end

  def test_it_creates_an_alphabet
    expected = ["a","b","c","d","e","f","g","h","i","j","k","l","m",
    "n","o","p","q","r","s","t","u","v","w","x","y","z"]
    assert_equal expected, @decrypt.create_letters
  end

  def test_it_can_combine_arrays
    assert_equal [3, 13, 29, 32], @decrypt.combine_arrays([1, 12, 23, 31],"011119")
  end

  def test_it_can_assign_keys
    expected = {"A"=>3, "B"=>13, "C"=>29, "D"=>32}
    assert_equal expected, @decrypt.shift_generator([1, 12, 23, 31], "011119")
  end

  def test_it_can_decrypt_a_message
    decrypt = Decrypter.new(@key, @offset)
    assert_equal "im over it!", decrypt.decrypt_message(@message,[1, 12, 23, 31], "011119")
  end

  def test_encryption_keys
    expected = {"a"=>"g", "b"=>"h", "c"=>"i", "d"=>"j", "e"=>"k", "f"=>"l", "g"=>"m", "h"=>"n", "i"=>"o", "j"=>"p", "k"=>"q",
    "l"=>"r", "m"=>"s", "n"=>"t", "o"=>"u", "p"=>"v", "q"=>"w", "r"=>"x", "s"=>"y", "t"=>"z", "u"=>"a",
    "v"=>"b", "w"=>"c", "x"=>"d", "y"=>"e", "z"=>"f"}
    assert_equal Hash, @decrypt.shift_hash([1, 12, 23, 31], "011119").class
    assert_equal [0, 1, 2, 3], @decrypt.encrypter.keys
    assert_equal expected, @decrypt.encrypter[3]
  end
end
