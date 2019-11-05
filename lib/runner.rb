require './lib/encrypt'
require './lib/enigma'
require './lib/keys'
require './lib/offset'
require './lib/decrypt'

key = Keys.new
offset = Offset.new
encrypts = Encrypt.new(key, offset)
decrypts = Decrypt.new(key, offset)
enigma = Enigma.new(encrypts, decrypts)
puts enigma.encrypt("Im over it!", '34264')
puts enigma.decrypt("sd bfvx sk!", '34264')
