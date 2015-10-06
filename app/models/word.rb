class Word < ActiveRecord::Base
  attr_accessible :korean, :flashcard, :example_sentence,
                  :word_id 
  
  validates :korean, :presence => true
  
  has_many :example_sentence_words
  has_many :example_sentences, :through => :example_sentence_words
  has_many :flashcards
  has_many :translations
  
  def has_example_sentences?
    example_sentences.count != 0
  end
end
