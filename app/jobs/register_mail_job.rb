class RegisterMailJob < ApplicationJob
  queue_as :default

  def perform(user, event)
    RegisterMailer.with(user: user, event: event).register_mail.deliver_later
  end
end
