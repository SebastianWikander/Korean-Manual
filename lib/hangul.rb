#!/bin/env ruby
# encoding: utf-8

SBase = "AC00".hex
LBase = "1100".hex
VBase = "1161".hex
TBase = "11A7".hex
SCount = 11172
LCount = 19
VCount = 21
TCount = 28
NCount = VCount * TCount

class Hangul
  require 'jamo'
  
  def initialize(char)
      @char = char
      @jamo = decompose(char)
  end
  
  def char
    @char
  end
  
  def set_vowel(vowel)
    compose(@jamo.set_vowel(vowel))
  end
    
  def set_trailing(trailing)
    compose(@jamo.set_trailing(trailing))
  end
  
  def trailing?
    @jamo.trailing?
  end
    
  def is_leading?(char)
    @jamo.is_leading? char
  end
    
  def is_vowel?(char)
    @jamo.is_vowel? char
  end
    
  def is_trailing?(char)
    @jamo.is_trailing? char
  end
    
  private
    
  def pack(char)
    Array[char].pack('U*')
  end
    
  def unpack(char)
    char.unpack('U*').first
  end
    
  def decompose(char)
    char_index = unpack(char) - SBase
    if 0 <= char_index and char_index <= SCount
      leading = LBase + char_index / NCount
      vowel = VBase + (char_index % NCount) / TCount 
      trailing = TBase + char_index % TCount
    end
    Jamo.new(pack(leading), pack(vowel), pack(trailing))
  end
    
  def compose(jamo)
    @char = pack((jamo.l_index * VCount + jamo.v_index) * TCount + jamo.t_index + SBase)
  end
end