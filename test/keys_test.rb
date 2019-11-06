require './test/test_helper'
require './lib/keys'

class KeysTest < Minitest::Test

  def setup
    @keys = Keys.new
  end

  def test_it_exists
    assert_instance_of Keys, @keys
  end

  def test_it_can_create_a_five_digit_number
    assert_equal 5, @keys.rand_num_generator.length
    assert_equal String, @keys.rand_num_generator.class
  end

  def test_it_can_split_up_random_number_into_an_array
    @keys.expects(:rand_num_generator).returns('01231')
    assert_equal [1, 12, 23, 31], @keys.key_array_generator
    assert_equal [1, 12, 23, 31], @keys.key_array_generator('01231')
  end

end
