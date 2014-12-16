class UserMailer < ActionMailer::Base
  default from: 'arnaud.laurenty@gmail.com'

  def welcome(user)
    @user = user  # Instance variable => available in view
    mail(to: @user.email, subject: 'Bienvenue dans la communauté Electroscope !')
    # This will render a view in `app/views/user_mailer`!
  end

  def sponsor_giver(sponsorship, giver)
    @giver = giver
    @sponsorship = sponsorship  # Instance variable => available in view
    mail(to: @giver.email, subject: 'Merci pour votre parrainage !')
    # This will render a view in `app/views/user_mailer`!
  end

  def sponsor_receiver(sponsorship, giver)
    @giver = giver
    @sponsorship = sponsorship  # Instance variable => available in view
    mail(to: @sponsorship.receiver_email, subject: "Vous venez d'être parrainé !" )
    # This will render a view in `app/views/user_mailer`!
  end


end

