class SendEventsJob
  include Sidekiq::Job

  def perform(*args)
    users = User.pluck(:email)
    EventMailer.with(users: users).event_email.deliver_later
  end
end
