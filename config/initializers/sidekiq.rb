# inside config/initializers/sidekiq.rb
require 'sidekiq'
require 'sidekiq-cron'

Sidekiq::Cron::Job.create(
  name: 'my cron worker',
  cron: '0 * * * *',
  class: 'MyCronJobWorkerJob'
)

Sidekiq::Cron::Job.create(
  name: 'send events',
  cron: '0 0 * * *',
  class: 'SendEventsJob'
)

Sidekiq::Cron::Job.create(
  name: 'send reminder',
  cron: '* * * * *',
  class: 'ReminderJob'
)