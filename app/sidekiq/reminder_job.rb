class ReminderJob
  include Sidekiq::Job

  def perform(*args)
    time_range_set = DateTime.now+5.hours
    event = Event.find_by_event_time(time_range_set)
    users = event.users.pluck(:email)
    ReminderMailer.with(users: users, event: event).notify_email.deliver_later
  end
end