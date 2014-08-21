=begin

=end

def hamming_distance(string1, string2)
  if string1.length != string2.length
    raise StandardError, 'Strings are not of equal length'
  end
  require_relative "s1c2"
  string1 = string1.unpack("h*").join('')
  string2 = string2.unpack("h*").join('')
  return xor(string1, string2).unpack('B*').join('').count('1')
end

def test_hamming_distance()
  string1 = "this is a test"
  string2 = "wokka wokka!!!"
  return hamming_distance(string1, string2) === 37
end

puts test_hamming_distance()