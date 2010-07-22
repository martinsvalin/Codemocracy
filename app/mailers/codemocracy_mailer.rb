# encoding: UTF-8
class CodemocracyMailer < ActionMailer::Base
  default :from => "martin@codemocracy.se"
  default_url_options[:host] = "codemocracy.se"
  
  def registered(registration)
    @registration = registration
    @contact_email = "codemocracy@codemocracy.se"
    mail(
      :to => registration.email,
      :subject => "Du är nu anmäld till Codemocracy"        
    )
  end
  
  def email_login(user)
    @user = user
    @contact_email = "codemocracy@codemocracy.se"
    @url = password_reset_url(@user.perishable_token)
    mail(
      :to => user.email,
      :subject => "Login for Codemocracy"
    )
  end
end
