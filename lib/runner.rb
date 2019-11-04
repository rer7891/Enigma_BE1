require './lib/encrypt'
require './lib/enigma'
require './lib/shift_generator'
require './lib/enigma'

keys = Keys.new(date)
date = Time.now.strftime("%d%m%y")
encrypt = Encrypt.new(shift_generator)
enigma = Enigma.new(encrypt)

require "pry"; binding.pry
