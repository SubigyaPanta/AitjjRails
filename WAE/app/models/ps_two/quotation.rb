class PsTwo::Quotation < ApplicationRecord
  belongs_to :ps_two_authors
  belongs_to :ps_two_categories
end
