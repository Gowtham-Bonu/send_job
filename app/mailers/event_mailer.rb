class EventMailer < ApplicationMailer
  default from: 'gowthambonu99@gmail.com'

  def event_email
    users = params[:users]
    @events = Event.all
    mail(to: users)
  end
end
