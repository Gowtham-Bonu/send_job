class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  after_create do |user|
    SendWelcomeEmailJob.perform_later user
    CreateEmployeeJob.set(wait: 2.minutes).perform_later user
  end

  has_one :employee, dependent: :destroy
  has_many :registrations
  has_many :events, through: :registrations
end