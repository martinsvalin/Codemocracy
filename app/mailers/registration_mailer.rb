# encoding: UTF-8
class RegistrationMailer < ActionMailer::Base
  default :from => "martin@codemocracy.se"
  
  def registered(registration)
      @registration = registration
      @program_url  = "http://codemocracy.se/program"
      @contact_email = "codemocracy@codemocracy.se"
      mail(:to => registration.email,
           :subject => "Du är nu anmäld till Codemocracy")
    end
  
end
