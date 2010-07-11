# encoding: UTF-8
class RegistrationMailer < ActionMailer::Base
  default :from => "martin@codemocracy.se"
  default_url_options[:host] = "codemocracy.se"
  
  def registered(registration)
      @registration = registration
      @contact_email = "codemocracy@codemocracy.se"
      mail(:to => registration.email,
           :subject => "Du är nu anmäld till Codemocracy")
    end
  
end
