class PsTwo::Category < ApplicationRecord
  validates_uniqueness_of :name
end
