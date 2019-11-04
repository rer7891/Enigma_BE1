keys = Keys.new(date)
date = Time.now.strftime("%d%m%y")
encrypt = Encrypt.new(shift_generator)
enigma = Enigma.new(encrypt)

require "pry"; binding.pry
