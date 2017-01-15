class Review < ApplicationRecord
  belongs_to :user
  belongs_to :reviser

  
end
