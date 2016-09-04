class PsTwo::Quotation < ApplicationRecord
  belongs_to :ps_two_authors, class_name: "PsTwo::Author", foreign_key: "ps_two_authors_id"
  belongs_to :ps_two_categories, class_name: "PsTwo::Category", foreign_key: "ps_two_categories_id"
end
