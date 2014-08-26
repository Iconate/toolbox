=begin

The hex encoded string:

1b37373331363f78151b7f2b783431333d78397828372d363c78373e783a393b3736

... has been XOR'd against a single character. Find the key, decrypt the message.

You can do this by hand. But don't: write code to do it for you.
How? Devise some method for "scoring" a piece of English plaintext. Character frequency is a good metric. Evaluate each output and choose the one with the best score.
=end

#nice visual: "1b 37 37 33 31 36 3f 78 15 1b 7f 2b 78 34 31 33 3d 78 39 78 28 37 2d 36 3c 78 37 3e 78 3a 39 3b 37 36"
hexstring = "1b37373331363f78151b7f2b783431333d78397828372d363c78373e783a393b3736"
#answer =   "436f6f6b696e67204d432773206c696b65206120706f756e64206f66206261636f6e"

def bin_to_hex(s)
  s.each_byte.map { |b| b.to_s(16) }.join
end

def hex_to_bin(s)
  s.scan(/../).map { |x| x.hex.chr }.join
end

def repeated_char_xor(hex_string, hex_char)
  repeated_char = hex_char * (hex_string.length/hex_char.length)
  return xor(hex_string, repeated_char)
end

def freq_analysis(some_string)
  #initialize character array
  char_arr =  some_string.split(//).uniq
  hash = {}
  char_arr.each do |x|
    hash[x] = 0
  end
  
  some_string.each_char do |x|
    curr = hash[x]
    hash[x] = curr + 1
  end

  #count occurances
  return hash
end






