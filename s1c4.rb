=begin
One of the 60-character strings in the file ../Resources/s1c4.txt has been encrypted by single-character XOR.

Find it.
=end

def read_hex_strings_file()
  require_relative('s1c3.rb')
  file_path = File.expand_path("../resources/s1c4.txt", __FILE__)
  best_score = best_dec = line_num = best_line_num = 0
  puts "Running file..."
  File.readlines(file_path).each do |line|
    line_num = line_num + 1
    results = full_score(line)
    if results["best_score"] > best_score
      best_score = results["best_score"]
      best_dec = results["best_dec"]
      best_line_num = line_num
    end
  end
  return {
    'best_score' => best_score,
    'best_dec' => best_dec,
    'best_line_num' => best_line_num,
  }
end

puts read_hex_strings_file()