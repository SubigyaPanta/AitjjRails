json.extract! message_template, :id, :name, :message, :created_at, :updated_at
json.url message_template_url(message_template, format: :json)