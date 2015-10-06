#!/bin/env ruby
# encoding: utf-8

class Verb 
  require 'word'
  require 'hangul'
  
  def initialize(verb)
    @verb = KoreanWord.new(verb)
  end
  
  # Conjugations
  def present
    @conjugate = KoreanWord.new(@verb.to_s)
    self
  end
  
  def stem
    @conjugate = @conjugate.stem.to_s
  end
  
  def past
    @conjugate = KoreanWord.new(@verb.to_s).stem
    if @conjugate.last.trailing?
      if @conjugate.last.is_vowel? "ㅏ"
        if @conjugate.last.is_leading? "ㅎ"
          @conjugate.last.set_vowel "ㅐ"
        end
        @conjugate.last.set_trailing "ㅆ"
      elsif @conjugate.last.is_vowel? "ㅗ" 
        @conjugate.last.set_vowel "ㅘ"
        @conjugate.last.set_trailing "ㅆ"
      elsif @conjugate.last.is_vowel? "ㅣ"
        if @conjugate.last.is_leading? "ㅅ"
          @conjugate.last.set_vowel "ㅕ"  
          @conjugate.last.set_trailing "ㅆ"        
        end
      else
        @conjugate.add("었")
      end
      @conjugate.add("다")
    elsif @conjugate.last.is_trailing? "ㄷ"
      @conjugate.last.set_trailing "ㄹ"
      @conjugate.add("었다")
    else
      @conjugate.add("었다")
    end
    self
  end
  
  def future
    @conjugate = KoreanWord.new(@verb.to_s).stem.add("겠다")
    self
  end
  
  def imperative
    @conjugate = KoreanWord.new(@verb.to_s).stem.add("자")
    self
  end
  
  def propositive
    @conjugate = KoreanWord.new(@verb.to_s).stem.add("라")
    self
  end
  
  def interrogative
    @conjugate.stem
    if @conjugate.last.trailing?
      if @conjugate.last.is_vowel? "ㅣ"
        if @conjugate.last.is_leading? "ㄴ"
          @conjugate.add("까")
        end
      end
    else
      @conjugate.add("느냐")
    end
    self
  end
  
  # Honorifics
  def honorific
    @conjugate.stem
    if @conjugate.last.trailing?
      @conjugate.add("시다")
    else
      @conjugate.add("으시다")
    end
    self
  end
  
  # Honorifics
  def plain
    if @conjugate.last.char == "다"
      @conjugate.stem
      if @conjugate.last.trailing?
        @conjugate.last.set_trailing("ㄴ")
      else
      end
      @conjugate.add("다")
    end
    @conjugate.to_s
  end
    
  def informal
    @conjugate.stem
    if @conjugate.last.trailing?
      if @conjugate.last.is_vowel? "ㅏ"
        if @conjugate.last.is_leading? "ㅎ"
          @conjugate.last.set_vowel "ㅐ"
        end
      elsif @conjugate.last.is_vowel? "ㅣ"
        if @conjugate.last.is_leading? "ㅅ"
          @conjugate.last.set_vowel "ㅕ"          
        end
      elsif @conjugate.last.is_vowel? "ㅗ" 
        @conjugate.last.set_vowel "ㅘ"
      elsif @conjugate.last.is_vowel?"ㅜ"
        # @conjugate.last.set_vowel "ㅝ"
        @conjugate.add("어")
      elsif @conjugate.last.is_vowel? "ㅡ"
        @conjugate.last.set_vowel "ㅓ"
      end
    else
      if @conjugate.last.is_trailing? "ㅂ"
        @conjugate.add("워")
      elsif @conjugate.last.is_trailing? "ㄷ"
        @conjugate.last.set_trailing "ㄹ"
        @conjugate.add("어")
      else
        @conjugate.add("어")
      end
    end
    @conjugate.to_s
  end
    
  def polite
    informal + "요"
  end
    
  def formal
    @conjugate.stem
    if @conjugate.last.trailing?
      @conjugate.last.set_trailing "ㅂ"
      @conjugate.to_s + "니다"
    else
      @conjugate.to_s + "습니다"
    end
  end
    
  # Connective
  def connective
    KoreanWord.new(@verb.to_s).stem.add("고").to_s
  end
end