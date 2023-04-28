class ReminderMailer < ApplicationMailer
  default from: 'gowthambonu99@gmail.com'

  def notify_email
    users = params[:users]
    @event = params[:event]
    mail(to: users, subject: 'reminder!')
  end
end