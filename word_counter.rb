input_file_name = ARGV[0]
input_count = ARGV[1].to_i

def access(variable_file)
  File.read(variable_file)
end

def word_array(sort_file)
  access(sort_file).downcase.gsub(/[^a-z0-9'\s\-]/, '').split(" ")
end

def common_words #the, of, or, and etc
  File.read("stop_words.txt").split(' ')
end

all_words = word_array(input_file_name)

word_counts = Hash.new 0

common_words.each do |word|
  all_words.delete(word)
end

all_words.each do |add_count|
  word_counts[add_count] += 1
end

ruby = word_counts.sort_by { |k, v| v }.last(input_count).reverse

ruby.each do |key, value|
  puts key + ': ' + value.to_s
end
