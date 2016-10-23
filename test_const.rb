#!/usr/bin/env ruby
require "test/unit"
require_relative "const"

class TestConst < Test::Unit::TestCase
  def test_extension
    assert_equal(".txt", Const::ACCEPTED_EXTENSION)
  end

  def test_regex
    assert_equal(/[a-zA-Z]+[0-9]*/, Const::WORD_REGEX)
  end

  def test_regex_match1
    assert_match(Const::WORD_REGEX, "batata")
  end

  def test_regex_match2
    assert_match(Const::WORD_REGEX, "batata123")
  end

  def test_regex_match3
    assert_equal("ok!o?][k".scan(Const::WORD_REGEX), ["ok","o", "k"])
  end

  def test_regex_no_match1
    assert_no_match(Const::WORD_REGEX, "123")
  end

  def test_regex_no_match2
    assert_no_match(Const::WORD_REGEX, "!-=")
  end

  def test_extension_msg
    assert_equal("Invalid input file extension, please provide a .txt", Const::INVALID_EXTENSION_MSG)
  end

  def test_keyword_msg
    assert_equal("Provided word is not a keyword", Const::NOT_KEYWORD_MSG)
  end
end
