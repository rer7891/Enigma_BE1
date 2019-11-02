require './test/test_helper'
require './lib/shift.rb'
require './lib/enigma.rb'

class EnigmaTest < Minitest::Test

  def setup
    @enigma = Enigma.new
  end

  def test_it_exists
    assert_instance_of Enigma, @enigma
  end 
end
