class ExampleSentenceWord < ActiveRecord::Base
  attr_accessible :example_sentence_id, :word_id
  
  belongs_to :example_sentence
  belongs_to :word
end
