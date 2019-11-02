require './test/test_helper'
require './lib/shift.rb'

class ShiftTest < Minitest::Test

  def setup
    @shift = Shift.new
  end

  def test_it_exists
    assert_instance_of Shift, @shift
  end

  def test_it_can_create_a_five_digit_number
    assert_equal 5, @shift.rand_num_generator.length
    assert_equal String, @shift.rand_num_generator.class

  end

  # def test_it_can_split_up_random_number_into_an_array
  #   expected = ["01", "14", "45", "54"]
  #   assert_equal expected, @shift.array_generator
  # end

  def test_it_can_assign_keys
    expected = {"A"=>"0", "B"=>"0", "C"=>"0", "D"=>"0"}
    assert_equal expected, @shift.key_generator
  end

  def test_it_can_assign_values
    expected = {"A"=>"01", "B"=>"14", "C"=>"45", "D"=>"54"}
    assert_equal expected, @shift.value_assigner
  end
end
