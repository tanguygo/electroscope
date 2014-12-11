class UserMailer < ActionMailer::Base
  default from: 'arnaud.laurenty@gmail.com'

  def welcome(user)
    @user = user  # Instance variable => available in view
    mail(to: @user.email, subject: 'Bienvenue dans la communauté Electroscope !')
    # This will render a view in `app/views/user_mailer`!
  end
end

