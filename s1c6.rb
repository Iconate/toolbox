=begin

=end

def hamming_distance(string1, string2)
  if string1.length != string2.length
    raise StandardError, 'Strings are not of equal length'
  end
  require_relative "s1c2"
  require_relative "s1c3"
  string1 = bin_to_hex(string1)
  string2 = bin_to_hex(string2)
  result = xor(string1, string2)
  puts result.unpack("b*")
  return result
end

def test_hamming_distance()
  string1 = "this is a test"
  string2 = "wokka wokka!!!"
  return hamming_distance(string1, string2) === 37
end
stringer = "001100000111000000100001100001000001010010010000010001001111000010100100101100010101010001000101001001010101"
puts test_hamming_distance()