require './test/test_helper'
require './lib/shift'

class ShiftTest < Minitest::Test

  def setup
    @shift = Shift.new
  end

  def test_it_exists
    assert_instance_of Shift, @shift
  end

  def test_it_can_create_a_date
    @shift.expects(:create_a_date).returns("011119")
    assert_equal "011119", @shift.create_a_date
  end

  def test_it_can_multiply_date
    @shift.expects(:create_a_date).at_least_once.returns("011119")
    assert_equal 123632161, @shift.multiply_date
  end

  def test_it_can_make_an_offset
    @shift.expects(:create_a_date).at_least_once.returns("011119")
    assert_equal [2, 1, 6, 1], @shift.make_offset
  end

  def test_it_can_create_a_five_digit_number
    assert_equal 5, @shift.rand_num_generator.length
    assert_equal String, @shift.rand_num_generator.class
  end

  def test_it_can_split_up_random_number_into_an_array
    @shift.expects(:rand_num_generator).returns('01231')
    assert_equal [1, 12, 23, 31], @shift.key_array_generator
  end

  def test_it_can_combine_arrays
    @shift.expects(:rand_num_generator).at_least_once.returns('01231')
    @shift.expects(:create_a_date).at_least_once.returns("011119")
    assert_equal [3, 13, 29, 32], @shift.combine_arrays
  end

  def test_it_can_assign_keys
    expected = {"A"=>3, "B"=>13, "C"=>29, "D"=>32}
    @shift.expects(:rand_num_generator).at_least_once.returns('01231')
    @shift.expects(:create_a_date).at_least_once.returns("011119")
    assert_equal expected, @shift.shift_generator
  end
end
