# These are our command line prompts to access the file name and the number of top items you want to list
input_file_name = ARGV[0]
input_count = ARGV[1].to_i

# Here is where we call to access the file in the ARGV
def access(variable_file)
  File.read(variable_file)
end

# Here is what takes the file from the access method and eliminates everything but letter and puts it into a string
def word_array(sort_file)
  access(sort_file).downcase.gsub(/[^a-z0-9'\s\-]/, '').split(" ")
end

# This is our common words file that lists all words we want to exclude from our output
def common_words #the, of, or, and etc
  File.read("stop_words.txt").split(' ')
end

# This gives us a full list of words from the file we chose
  # word_array looks for input_file_name from the command line(ARGV[0])
  # inside the word_array method, we are calling the access method.
  # the access method is where we open the file
  # word_array then sorts everything in that file into a string of just words
all_words = word_array(input_file_name)


# This is where we make our empty hash
word_counts = Hash.new 0

# This calls the common words file, which is split into a string, and tell its to delete each word in that file from the all_words list
common_words.each do |word|
  all_words.delete(word)
end

# Now that the all_words list has the words we want taken out, we can assign increase the value every time a word is repeated
all_words.each do |add_count|
  word_counts[add_count] += 1
end

# this is where we sort the word counts by values and order them to show the most freqent words first
ruby = word_counts.sort_by { |k, v| v }.last(input_count).reverse

# this takes the ruby variable we created to show the key: value (ex hello: 15)
ruby.each do |key, value|
  puts key + ': ' + value.to_s
end
