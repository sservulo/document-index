#!/usr/bin/env ruby
require "set"
require_relative "const"

class Index
  def initialize(input_filename, keywords_filename)
    @keywords = get_keywords(keywords_filename)
    @index = create_index(input_filename)
  end

  def get_keywords(filename)
      keywords = Set.new #for fast retrieval

      #parse each line of input file into a keyword (strips \n chars)
      File.open(filename, "r") do |file|
        while (word = file.gets)
            keywords.add(word.strip.downcase)
        end
      end

      keywords = keywords.sort #avoids copies
      return keywords
  end

  def create_index(filename)
    #each bucket could match to a Set instead of Array, but since Set may not preserve insert order, Array was preferred
    index = Hash.new { |h,k| h[k] = Array.new }

    #parse each line of input file
    File.open(filename, "r") do |file|
      line_count = 1
      while (line = file.gets)
        #tokenize line into words
        line.scan(Const::WORD_REGEX).each do |word|
          #verify if words is a keyword and if so, adds to index
          if @keywords.include? word.downcase
            index[word.downcase].push(line_count)
          end
        end
        line_count = line_count + 1
      end
    end

    #remove duplicates for each bucket
    index.each { |k, v| index[k] = v.uniq }

    return index
  end

  def where_appears(word)
    if not @keywords.include? word
      raise Const::NOT_KEYWORD
    end
    return @index[word]
  end

  def print
    @keywords.each do |word|
      puts "#{word} #{@index[word].join(', ')}"
    end
  end


end
