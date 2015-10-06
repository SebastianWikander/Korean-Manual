#!/bin/env ruby
# encoding: utf-8

class GrammarController < ApplicationController
  
  
  class Adjective
    def initialize(adjective)
      @adjective = adjective
    end
  end
  
  def index
    @title = t(:title)
    
    @verb = Verb.new("하다")
  end
end
