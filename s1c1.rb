=begin
 http://cryptopals.com/sets/1/challenges/1/

 Task: Convert the given hex string to base64.

 Given: 49276d206b696c6c696e6720796f757220627261696e206c696b65206120706f69736f6e6f7573206d757368726f6f6d

 Goal: SSdtIGtpbGxpbmcgeW91ciBicmFpbiBsaWtlIGEgcG9pc29ub3VzIG11c2hyb29t
=end

def hex_to_base64(hex)
  # Pack (ie. read stored data) as a hex value (H*)
  # Text should be: "I'm killing your brain like a poisonous mushroom"
  # Pack the result into base64 (m0). Note, m* does not yeild the correct answer
  return [[hex].pack("H*")].pack('m0');
end


def test_hex_to_base64()
  given = "49276d206b696c6c696e6720796f757220627261696e206c696b65206120706f69736f6e6f7573206d757368726f6f6d"
  goal = "SSdtIGtpbGxpbmcgeW91ciBicmFpbiBsaWtlIGEgcG9pc29ub3VzIG11c2hyb29t"
  return hex_to_base64(given) === goal
end

#puts test_hex_to_base64()