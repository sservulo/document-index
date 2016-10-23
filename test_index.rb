#!/usr/bin/env ruby
require "set"
require "tempfile"
require "test/unit"
require_relative "index"

class TestIndex < Test::Unit::TestCase
  def setup
    keywords_file = Tempfile.new("keywords")
    keywords_file.write("word1\nword2\nword3\n")
    keywords_file.close

    input_file = Tempfile.new("keywords")
    input_file.write("word1,word2, word1\nword3\n\nwod1!wor?d2,word3")
    input_file.close

    @index = Index.new(input_file.path, keywords_file.path)
  end

  def test_keywords
    assert_equal(["word1","word2","word3"], @index.instance_variable_get(:@keywords))
  end

  def test_index1
    assert_equal([1], @index.where_appears("word1"))
  end

  def test_index2
    assert_equal([1], @index.where_appears("word2"))
  end

  def test_index3
    assert_equal([2, 4], @index.where_appears("word3"))
  end
end
