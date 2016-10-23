#!/usr/bin/env ruby
require "test/unit"
require_relative "validator"

class TestValidator < Test::Unit::TestCase
  def test_valid_extension
    assert_equal(true, Validator.is_extension_valid("test.txt"))
  end

  def test_invalid_extension
    assert_equal(false, Validator.is_extension_valid("test.exe"))
  end
end
