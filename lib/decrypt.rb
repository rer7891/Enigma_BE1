require './lib/enigma'
require './lib/keys'
require './lib/offset'
require './lib/decrypter'
require './lib/encrypter'

handle = File.open(ARGV[0], "r")
encrypted_message = handle.read
handle.close

key = Keys.new
offset = Offset.new
encrypts = Encrypter.new(key, offset)
decrypts = Decrypter.new(key, offset)
enigma = Enigma.new(encrypts, decrypts)
decryption = enigma.decrypt(encrypted_message, ARGV[2], date = ARGV[3])

encrypted = File.open(ARGV[1], "w")
encrypted.write(decryption[:decryption])
encrypted.close

puts "Created 'decrypted.txt' with the key #{decryption[:key]} and date #{decryption[:date]}."
