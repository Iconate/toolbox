=begin
Write a function for calculating the hamming distance

Test:
The distance between -
"this is a test" and
"wokka wokka!!!"

Should be 37

1100000111000000100001100001000001010010010000010001001111000010100100101100010101010001000101001001010101

=end

def hamming_distance(string1, string2)
  if string1.length != string2.length
    raise StandardError, 'Strings are not of equal length'
  end
  require_relative "s1c3"
  require_relative "s1c2"
  string1 = bin_to_hex(string1);
  string2 = bin_to_hex(string2);
  return xor(string1,string2).to_i(16).to_s(2).count('1')
end

def test_hamming_distance()
  string1 = "this is a test"
  string2 = "wokka wokka!!!"
  distance = hamming_distance(string1, string2)
  return distance === 37
end


#puts test_hamming_distance()