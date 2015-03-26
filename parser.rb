line_count = 0
word_count = 0
byte_count = 0

File.foreach(ARGV[0]) do |line|
	line_count += 1
	byte_count += line.length # Pre-calculated length
	looking_at_word = false

	# Traverse through the line and count words along the way
	# to avoid unnecessary string allocation (i.e. "split")
	line.each_char do |c|
		if c =~ /\s/
			looking_at_word = false
		elsif !looking_at_word
			looking_at_word = true
			word_count += 1
		end
	end
end

printf("%u %7u %7u %s\n", line_count, word_count, byte_count, ARGV[0])