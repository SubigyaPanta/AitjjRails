module MessageTemplatesHelper
  def replace_sender_with(original_string, sender_name )
    original_string.sub '[:sender]', sender_name
  end
end
