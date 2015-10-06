#!/bin/env ruby
# encoding: utf-8

class Jamo
  No_Jamo = Array["11A7".hex].pack('U*')
      
  def initialize(leading, vowel, trailing)
    @leading = leading
    @vowel = vowel
    @trailing = trailing
  end
      
  def l_index
    @leading.unpack('U*').first - LBase
  end
      
  def v_index
    @vowel.unpack('U*').first - VBase
  end
      
  def t_index
    @trailing.unpack('U*').first - TBase
  end
      
  def trailing?
    @trailing == No_Jamo
  end
      
  def remove_trailing
    @trailing = No_jamo
    self
  end
      
  def is_leading?(char)
    @leading == utf(char)
  end
    
  def is_vowel?(char)
    @vowel == utf(char)
  end
    
  def is_trailing?(char)
    @trailing == utf_trail(char)
  end
    
  def set_vowel(vowel)
    @vowel = utf(vowel)
    self
  end
      
  def set_trailing(trailing)
    @trailing = utf_trail(trailing)
    self
  end
  
  # returns a properly utf-formatted hangul jamo
  def utf(char)
    char = char.unpack('U*').first
    case char
    when "3134".hex
      # consonants ㄴ "1102"
      char = "1102".hex
    when "3141".hex.."3143".hex
      # consonants ㅁ to ㅃ
      char_dist = "3141".hex - "1106".hex
      char = char - char_dist
    when "3145".hex.."314E".hex
      # consonants ㅅ to ㅎ
      char_dist = "3145".hex - "1109".hex
      char = char - char_dist
    when "314F".hex.."3163".hex
      # vowels ㅏ to ㅣ
      char_dist = "314F".hex - "1161".hex
      char = char - char_dist
    end
    Array[char].pack('U*')
  end
  
  def utf_trail(char)
    char = char.unpack('U*').first
    case char
    when "3134".hex
      # consonants ㄴ "1102"
      char = "11AB".hex
    when "3131".hex.."3137".hex
      # consonants ㄱ to ㄷ
      char_dist = "3131".hex - "11A8".hex
      char = char - char_dist
    when "3139".hex.."3142".hex
      # consonants ㄹ to ㅂ
      char_dist = "3139".hex - "11AF".hex
      char = char - char_dist
    when "3144".hex.."314E".hex
      # consonants ㅅ to ㅎ
      char_dist = "3144".hex - "11B9".hex
      char = char - char_dist
    end
    Array[char].pack('U*')
  end
end
