=begin
  http://cryptopals.com/sets/1/challenges/2/

  Goal: Write a function that takes two equal-length buffers and produces their XOR combination.

  Test:

  1c0111001f010100061a024b53535009181c (decode = "KSSP")

  ... after hex decoding, and when XOR'd against:

  686974207468652062756c6c277320657965 (decode = "hit the bull's eye")

  ... should produce:

  746865206b696420646f6e277420706c6179
=end

def xor(param1, param2)
  return (param1.to_i(16) ^ param2.to_i(16)).to_s(16)
end

def text_xor()
  param1 = "1c0111001f010100061a024b53535009181c"
  param2 = "686974207468652062756c6c277320657965"
  result = "746865206b696420646f6e277420706c6179"
  return xor(param1, param2) === result
end

puts text_xor()