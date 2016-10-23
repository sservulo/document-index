#!/usr/bin/env ruby

class Const
  ACCEPTED_EXTENSION = ".txt"
  WORD_REGEX = /[a-zA-Z]+[0-9]*/

  INVALID_EXTENSION_MSG = "Invalid input file extension, please provide a .txt"
  NOT_KEYWORD_MSG = "Provided word is not a keyword"
end
