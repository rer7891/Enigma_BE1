require './test/test_helper'
require './lib/offset'

class OffsetTest < Minitest::Test

  def setup
    @offset = Offset.new
  end

  def test_it_exists
    assert_instance_of Offset, @offset
  end

  def test_it_can_create_a_date
  assert_equal 6, @offset.create_a_date.length
  assert_equal String, @offset.create_a_date.class
  @offset.expects(:create_a_date).returns("011119")
  assert_equal "011119", @offset.create_a_date
end

  def test_it_can_multiply_date
    @offset.expects(:create_a_date).at_least_once.returns("011119")
    assert_equal 123632161, @offset.multiply_date
  end

  def test_it_can_make_an_offset
    @offset.expects(:create_a_date).at_least_once.returns("011119")
    assert_equal [2, 1, 6, 1], @offset.make_offset(@offset.multiply_date)
  end
end
