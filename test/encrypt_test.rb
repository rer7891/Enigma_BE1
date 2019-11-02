require './test/test_helper'
require './lib/shift'
require './lib/encrypt'

class EncryptTest < MiniTest::Test

  def setup
    @shift = Shift.new
    key = shift.key_array_generator
    offset = shift.make_offset
    @encrypt = Encrypt.new(key, offset)
  end

  def test_it_exists
    assert_instance_of Encrypt, @encrypt
  end

  def test_it_initializes
    @shift.expects(:rand_num_generator).at_least_once.returns('01231')
    @shift.expects(:create_a_date).returns("011119")
    assert_equal 
  end
end
