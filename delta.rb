=begin
 Computes the delta for any hexstring
=end


def delta(hex, key_length = 1)
   require_relative('s1c2')
   input = hex.scan(/../)
   delta = []
   # careful about indexes
   (0..input.length - 1).each{ |x|
     if x + key_length <= input.length - 1
       delta.push(xor(input[x], input[x+key_length]))
     end
   }
   return delta.join()
end

require_relative('s1c3')
plain = "This program cannot be run in DOS mode"
encoded_plain = single_xor(bin_to_hex(plain), "X")
delta_encoded = delta(encoded_plain)
hexed = bin_to_hex(plain)
search_string = "This program"
delta_search = delta(bin_to_hex(search_string))


puts encoded_plain
puts delta_encoded
puts search_string
puts delta_search
puts delta_encoded.include? delta_search