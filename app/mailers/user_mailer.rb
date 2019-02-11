class UserMailer < ApplicationMailer
  default from: "andreas_koeth@gmx.de"

  def contact_form(email, name, message)
  @message = message
    mail(from: email,
         to: 'andreas_koeth@gmx.de',
         subject: "A new contact form message from #{name}")
end


  def welcome(user)
    @appname = "duke-wellington-example-app"
    mail(to: user.email,
         subject: "Welcome to #{@appname}!")
  end

end
