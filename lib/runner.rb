require './lib/encrypter'
require './lib/enigma'
require './lib/keys'
require './lib/offset'
require './lib/decrypter'

key = Keys.new
offset = Offset.new
encrypts = Encrypter.new(key, offset)
decrypts = Decrypter.new(key, offset)
enigma = Enigma.new(encrypts, decrypts)
puts enigma.encrypt("Im over it!", '34264')
puts enigma.decrypt("sd bfvx sk!", '34264')
