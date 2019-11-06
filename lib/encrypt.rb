require_relative 'enigma'
require_relative 'keys'
require_relative 'offset'
require_relative 'encrypter'
require_relative 'decrypter'

key = Keys.new
offset = Offset.new
encrypts = Encrypter.new(key, offset)
decrypts = Decrypter.new(key, offset)
enigma = Enigma.new(encrypts, decrypts)

handle = File.open(ARGV[0], "r")
messages = handle.read
handle.close

encryption = enigma.encrypt(messages)
encrypted = File.open(ARGV[1], "w")
encrypted.write (encryption[:encryption])
encrypted.close

puts "Created 'encrypted.txt' with the key #{encryption[:key]} and date #{encryption[:date]}"
