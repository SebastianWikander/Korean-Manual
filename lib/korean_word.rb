#!/bin/env ruby
# encoding: utf-8

class KoreanWord
  require 'hangul'
  
  def initialize(word)
    @word = word.split(//).map { |char| Hangul.new(char) }
  end
  
  def add(chars)
    @word = @word + chars.split(//).map { |char| Hangul.new(char) }
    self
  end
  
  def to_s
    @word.map{ |char| char.char }.join
  end
  
  def stem
    @word = @word.first(@word.length-1)
    self
  end
  
  def last
    @word.last
  end
end
