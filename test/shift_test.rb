require './test/test_helper'
require './lib/shift.rb'

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

  def test_it_can_create_a_five_digit_number
    assert_equal 5, @shift.rand_num_generator.length
    assert_equal String, @shift.rand_num_generator.class
  end

  def test_it_can_split_up_random_number_into_an_array
    expected = ["01", "14", "45", "54"]
    @shift.expects(:array_generator).returns(expected)
    assert_equal expected, @shift.array_generator
  end

  def test_it_can_assign_keys
    expected = {"A"=>1, "B"=>14, "C"=>45, "D"=>56}
    @shift.expects(:shift_generator).returns(expected)
    assert_equal expected, @shift.shift_generator
  end

  def test_it_can_multiply_date
    @shift.expects(:multiply_date).returns(123632161)
    assert_equal 123632161, @shift.multiply_date
  end

  def test_it_can_chop_date
    @shift.expects(:chop_date).returns([2, 1, 6, 1])
    assert_equal [2, 1, 6, 1], @shift.chop_date
  end

  def test_it_can_combine_arrays
    @shift.expects(:combine_arrays).returns([34, 45, 56, 75])
    assert_equal [34, 45, 56, 75], @shift.combine_arrays
  end
end
