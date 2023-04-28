class CreateEmployeeJob < ApplicationJob
  queue_as :default

  def perform(user)
    Employee.create(email: user.email, user_id: user.id)
  end
end
