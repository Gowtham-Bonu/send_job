require 'faker'

class MyCronJobWorkerJob
  include Sidekiq::Job

  def perform(*args)
    Event.create(title: Faker::Name.name, event_time: DateTime.now+5.hours)
  end
end
