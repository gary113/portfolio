class Message < ApplicationRecord
  include Humanizer

  belongs_to(:profile)
  validates(:message_email, format: URI::MailTo::EMAIL_REGEXP)
  require_human_on(:create)

  enum(message_status: { unreaded: 0, readed: 1 })

  def message_status_humanized
    I18n.t("activerecord.attributes.message.message_statuses.#{message_status}")
  end
end
