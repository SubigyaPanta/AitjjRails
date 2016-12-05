class Notification < ApplicationRecord
  belongs_to :message_template, foreign_key: 'message_templates_id'
  belongs_to :receiver, class_name: "User"
  belongs_to :sender, class_name: "User"
end
