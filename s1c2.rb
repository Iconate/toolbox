=begin
  http://cryptopals.com/sets/1/challenges/2/

  Goal: Write a function that takes two equal-length buffers and produces their XOR combination.

  Test:

  1c0111001f010100061a024b53535009181c (decoded = "KSSP")

  ... after hex decoding, and when XOR'd against:

  686974207468652062756c6c277320657965 (decoded = "hit the bull's eye")

  ... should produce:

  746865206b696420646f6e277420706c6179 (decoded = "the kid don't play")
=end

def xor(param1, param2)
  if param1.length != param2.length
    raise StandardError, 'Parameters must be equal length'
  end
  return (param1.to_i(16) ^ param2.to_i(16)).to_s(16)
end

def text_xor()
  param1 = "1c0111001f010100061a024b53535009181c"
  param2 = "686974207468652062756c6c277320657965"
  result = "746865206b696420646f6e277420706c6179"
  return xor(param1, param2) === result
end

#puts text_xor()