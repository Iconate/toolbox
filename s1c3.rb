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

class String
  def alpha?
    !!match(/^[[:alnum:]]+$/)
  end
end

# hex_char

def single_xor(hex_string, char)
  require_relative('s1c2.rb')
  str_len = hex_string.length
  repeated_string = (bin_to_hex(char) * str_len).slice!(0..str_len - 1)
  return xor(hex_string, repeated_string)
end

def score(bin_string)
  #initialize character array
  char_arr =  bin_string.split(//).uniq

  hash = {}
  char_arr.each do |x|
    if x.alpha? || x.match(" ")
    hash[x] = 0
    end
  end

  score = 0
  bin_string.each_char do |x|
    if x.alpha? || x.match(" ")
    score = score + 1
    hash[x] = hash[x] + 1
    end

  end

  #for details
  #puts hash
  return score
end

def full_score(some_string)
  best_score = 0;
  index = 0;
  for i in 65..122
    #puts "Testing decimal value: " + i.to_s(10) + ", as character: "+ i.chr
    xor_result = single_xor(some_string, i.chr)
    #puts "Hex result is:" + xor_result
    bin_result = hex_to_bin(xor_result)
    puts "Binary result is:" + bin_result
    i_score = score(bin_result)
    puts "Score is:" + i_score.to_s(10)
    if i_score > best_score
      best_score = i_score
      index = i
    end  end
#puts "Best score: " + best_score.to_s(10)
#puts "At index: " + index.to_s(10)
  return { 'best_score' => best_score, 'best_dec' => index }
end

