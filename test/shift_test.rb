require './test/test_helper'
require './lib/shift.rb'

class ShiftTest < Minitest::Test

  def test_it_exists
    shift = Shift.new
    assert_instance_of Shift, shift.new
  end

  def test_it_can_create_a_five_digit_number
    assert_equal "01454", shift.expects(:rand_num).returns("01454")
  end 
end
