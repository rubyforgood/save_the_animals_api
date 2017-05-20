# frozen_string_literal: true

module ApplicationHelper
  FLASH_MESSAGE_CLASSES = { success: 'alert-success',
                            error: 'alert-danger',
                            alert: 'alert-warning',
                            notice: 'alert-info' }.stringify_keys.freeze

  def bootstrap_class_for(flash_type)
    FLASH_MESSAGE_CLASSES[flash_type] || flash_type.to_s
  end

  def flash_messages(_opts = {})
    flash.each do |msg_type, message|
      concat(content_tag(:div, message, class: "alert #{bootstrap_class_for(msg_type)} in") do
               concat content_tag(:button, 'x', class: 'close', data: { dismiss: 'alert' })
               concat message
             end)
    end
    nil
  end
end
