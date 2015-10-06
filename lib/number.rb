#!/bin/env ruby
# encoding: utf-8

KoreanNumbers = Array["일", "이", "삼", "사", "오", 
                      "육", "칠", "팔", "구", "십",]
KoreanNum = Array["백", "천","만"]

class Number
  def initialize(number)
    @number = number.to_s.split(//)
  end
    
  def korean
    @number.each{ |num| KoreanNumbers[num.to_i]}
  end
    
  def counter(counter)
    @number
  end
end