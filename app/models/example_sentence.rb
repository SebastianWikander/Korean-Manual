class ExampleSentence < ActiveRecord::Base
  attr_accessible :english, :korean, :example_sentence_id
  
  validates :korean, :presence => true
  validates :english, :presence => true
  
  has_many :example_sentence_words
  has_many :words, :through => :example_sentence_words
end
