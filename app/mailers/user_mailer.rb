class UserMailer < ApplicationMailer
  def send_mail(user)
    @user=user
    mail(to: @user.email,subject: "You Are Signed In")

  end
end
