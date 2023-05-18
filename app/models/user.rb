class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  with_options dependent: :destroy do |assoc|
    assoc.has_one :employee
    assoc.has_many :registrations
  end
  has_many :events, through: :registrations

  after_create do |user|
    SendWelcomeEmailJob.perform_later user
    CreateEmployeeJob.set(wait: 2.minutes).perform_later user
  end
end