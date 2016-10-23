#!/usr/bin/env ruby
require_relative "const"

class Validator
  def self.is_extension_valid(filename)
    return filename.end_with? Const::ACCEPTED_EXTENSION
  end
end
