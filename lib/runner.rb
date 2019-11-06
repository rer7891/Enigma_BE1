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
puts
puts enigma.encrypt("Hello world!", '34326','011119')
puts enigma.decrypt('rwxmy ipbdp!','34326','011119')
puts
puts encrypted = enigma.encrypt("hello world", "02715")
puts enigma.decrypt(encrypted[:encryption], "02715")
puts
puts enigma.encrypt("hello world")
