class Message < ApplicationRecord
  belongs_to(:profile)
  validates(:message_email, format: URI::MailTo::EMAIL_REGEXP)

  enum(message_status: { unreaded: 0, readed: 1 })

  def message_status_humanized
    I18n.t("activerecord.attributes.message.message_statuses.#{message_status}")
  end
end
