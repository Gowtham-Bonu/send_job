class RegisterMailer < ApplicationMailer
  default from: 'gowthambonu99@gmail.com'

  def register_mail
    user = params[:user]
    @event = params[:event]
    mail(to: user.email)
  end
end
