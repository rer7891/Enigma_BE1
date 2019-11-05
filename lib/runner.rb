require './lib/encrypt'
require './lib/enigma'
require './lib/keys'
require './lib/offset'

key = Keys.new
offset = Offset.new
encryts = Encrypt.new(key, offset)
enigma = Enigma.new(encrypts)

puts enigma.encrypt("Im over it!")
