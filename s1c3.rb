=begin

The hex encoded string:

1b37373331363f78151b7f2b783431333d78397828372d363c78373e783a393b3736

... has been XOR'd against a single character. Find the key, decrypt the message.

You can do this by hand. But don't: write code to do it for you.
How? Devise some method for "scoring" a piece of English plaintext. Character frequency is a good metric. Evaluate each output and choose the one with the best score.
=end

#nice visual: "1b 37 37 33 31 36 3f 78 15 1b 7f 2b 78 34 31 33 3d 78 39 78 28 37 2d 36 3c 78 37 3e 78 3a 39 3b 37 36"
hexstring = "1b37373331363f78151b7f2b783431333d78397828372d363c78373e783a393b3736"

# at least I believe thats the answer
answer =    "436f6f6b696e67204d432773206c696b65206120706f756e64206f66206261636f6e"

def hex_char_frequency(hex_string)
  frequencies = {
    1 => 0,
    2 => 0,
    3 => 0,
    4 => 0,
    5 => 0,
    6 => 0,
    7 => 0,
    8 => 0,
    9 => 0,
    10 => 0,
    11 => 0,
    12 => 0,
    13 => 0,
    14 => 0,
    15 => 0,
    16 => 0
  }
  hex_string.each_char do |x|
    index = x.to_i(16)
    current_val = frequencies[index]
    frequencies[index] = current_val + 1
  end
  puts frequencies
end

def readable_xor(hexstring, character)
  require_relative "s1c2"
  return [xor(hexstring, character)].pack("H*")
end

def exhaustive_hex_xor(hexstring)
  for hex_val in 0..255 do
    puts readable_xor(hexstring, "#{hex_val.to_s(16)}")
  end
end

require_relative "s1c2"
puts xor(hexstring, "FFFFFFFFFFFF")




