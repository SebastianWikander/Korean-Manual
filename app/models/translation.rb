class Translation < ActiveRecord::Base
  belongs_to :word
  
  attr_accessible :english
end
