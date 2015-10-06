class Flashcard < ActiveRecord::Base
  attr_accessible :level, :user, :word, :studied_dates, :word_id
  
  belongs_to :user
  belongs_to :word
  has_many :studied_dates
    
  def due
    
  end
  
  def times_studied
    
  end
end
