class StudiedDate < ActiveRecord::Base
  attr_accessible :date, :flashcard
  
  belongs_to :flashcard
end
