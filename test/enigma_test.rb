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
    @enigma = Enigma.new(@encrypts)
  end

  def test_i_exists
    assert_instance_of Enigma, @enigma
  end

  def test_it_initializes
    assert_equal Encrypt, @enigma.encrypts.class
  end

  def test_it_can_encrypt
    @offset.expects(:create_a_date).at_least_once.returns("011119")
    @keys.expects(:rand_num_generator).at_least_once.returns('01231')
    expected = {:encryption => @encrypts.encrypt_message("Im over it!"), :key => @encrypts.shift_generator, :date => @encrypts.offset.create_a_date }
    assert_equal expected, @enigma.encrypt("Im over it!")
  end
end
