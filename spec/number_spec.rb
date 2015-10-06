#!/bin/env ruby
# encoding: utf-8

require 'number'

describe Number do
  it "should return the number 1 in korean" do
    Number.new(1).korean.should eq("일")
  end
  it "should return the number 2 in korean" do
    Number.new(2).korean.should eq("이")
  end
  it "should return the number 3 in korean" do
    Number.new(3).korean.should eq("삼")
  end
  it "should return the number 15 in korean" do
    Number.new(15).korean.should eq("십일")
  end
  it "should return the number 103 in korean" do
    Number.new(103).korean.should eq("백삼")
  end
  it "should return the number 123 in korean" do
    Number.new(123).korean.should eq("백이십삼")
  end
  it "should return the number 10231 in korean" do
    Number.new(10231).korean.should eq("일만이백삼십일")
  end
end