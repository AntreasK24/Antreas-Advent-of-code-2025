def invalid_id?(s)
  n = s.length

  return false if n == 1

  for l in 1..(n - 1)

    next unless n % l == 0
    repetitions = n / l
    next unless repetitions >= 2

    pattern = s[0...l]
    repeated = true

    for k in 1...(repetitions)
      block_start = k * l
      block_end   = block_start + l - 1
      block       = s[block_start..block_end]

      if block != pattern
        repeated = false
        break
      end
    end

    return true if repeated
  end

  return false
end




begin
  content = File.read("input.txt")
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
    sum += i if invalid_id?(i.to_s)
  end
end

puts sum

