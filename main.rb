#!/usr/bin/env ruby
require_relative "const"
require_relative "index"
require_relative "validator"

input_filename = ARGV[0]
keywords_filename = ARGV[1]

if Validator.is_extension_valid(input_filename) && Validator.is_extension_valid(keywords_filename)
  index = Index.new(input_filename, keywords_filename)
  index.print
else
  puts Const::INVALID_EXTENSION_MSG
end
