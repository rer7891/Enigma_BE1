require './test/test_helper'
require './lib/shift_generator'

class KeysTest < Minitest::Test

  def setup
    date = Time.now.strftime("%d%m%y")
    @shift_generator = ShiftGenerator.new(date)
  end

  def test_it_exists
    assert_instance_of ShiftGenerator, @shift_generator
  end

  def test_it_can_create_a_five_digit_number
    assert_equal 5, @shift_generator.rand_num_generator.length
    assert_equal String, @shift_generator.rand_num_generator.class
  end

  def test_it_can_split_up_random_number_into_an_array
    @shift_generator.expects(:rand_num_generator).returns('01231')
    assert_equal [1, 12, 23, 31], @shift_generator.key_array_generator
  end

  def test_it_can_multiply_date
    @shift_generator.expects(:create_a_date).at_least_once.returns("011119")
    assert_equal 123632161, @shift_generator.multiply_date
  end

  def test_it_can_make_an_offset
    @shift_generator.expects(:create_a_date).at_least_once.returns("011119")
    assert_equal [2, 1, 6, 1], @shift_generator.make_offset
  end

  def test_it_can_combine_arrays
    assert_equal [3, 13, 29, 32], @shift_generator.combine_arrays
  end

  def test_it_can_assign_keys
    expected = {"A"=>3, "B"=>13, "C"=>29, "D"=>32}
    assert_equal expected, @shift_generator.shift_maker
  end


end
