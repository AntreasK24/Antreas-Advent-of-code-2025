begin
  content = File.read("example.txt")
rescue => e
  puts "Could not read the file: #{e.message}"
  exit
end

v = []
current_number = ""
left = nil

content.each_char do |char|
  if char =~ /\d/
    current_number << char

  elsif char == '-'
    puts "Dash detected"
    left = current_number.to_i
    current_number = ""

  elsif char == ','
    puts "Comma detected"
    right = current_number.to_i
    v << [left, right]
    current_number = ""
  end
end

# handle last number 
unless current_number.empty?
  right = current_number.to_i
  v << [left, right]
end

#puts v.inspect

sum = 0

v.each do |left, right|
  # puts left
  # puts right

  (left..right).each do |i|
    digits = i.to_s
    size = digits.length

    # only even-number-of-digits numbers can be split evenly
    if size.even?
      half  = size / 2
      front = digits[0...half]   # first half
      back  = digits[half..-1]   # second half

      if front == back
        sum += i
      end
    end
  end
end

puts sum

