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
    @shift.rand_num_generator
    #@shift.expects(:rand_num).at_least_once.returns("01454")
  end

  def test_it_can_split_up_random_number_into_keys
    expected = {"A"=>"01", "B"=>"14", "C"=>"45", "D"=>"54"}
    assert_equal expected, @shift.key_generator("01454")
  end
end
