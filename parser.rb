# This program counts the number of
# lines, words, and characters in a text file.
#
# The following words (case-sensitive) are ignored:
# * "I", "We", "You", "They"
# * "a", "and", "the", "that"
# * "of", "for", "with"
# (Spaces are left untouched.)
#
# Author:: Mark Yan

# Counts the number of words in a line of text
#
# Traverses through the line and counts words along the way
# to avaoid unnecessary string allocation (i.e. "split")
def num_words(line)
	word_count = 0
	looking_at_word = false

	line.each_char do |c|
		if c =~ /\s/
			looking_at_word = false
		elsif !looking_at_word
			looking_at_word = true
			word_count += 1
		end
	end
	return word_count
end

line_count = 0
all_word_count = 0
all_byte_count = 0

proper_word_count = 0
proper_byte_count = 0

pattern_front = /((?=(^|\s))(I|We|You|They|a|and|the|that|of|for|with))/
pattern_back = /((I|We|You|They|a|and|the|that|of|for|with)(?=($|\s)))/
pattern = Regexp.union(pattern_front, pattern_back)

File.foreach(ARGV[0]) do |line|
	line_count += 1
	
	# all
	all_byte_count += line.length 			# Pre-calculated string length
	all_word_count += num_words(line)

	# proper
	line.gsub!(pattern, '')
	proper_byte_count += line.length
	proper_word_count += num_words(line)
end

# Output Results
printf("all: %u %7u %7u %s\n", line_count, all_word_count, all_byte_count, ARGV[0])
printf("proper: %u %7u %7u %s\n", line_count, proper_word_count, proper_byte_count, ARGV[0])