class UserMailer < ApplicationMailer
  default from: 'madafulcar.herokuapp.com'
  
  def welcome_email(user)
    @user = user 
    @url  = 'https://madafulcar.herokuapp.com/'
    mail(to: @user.email, subject: 'Bienvenue chez Madafullcar') 
  end

end