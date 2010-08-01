# encoding: UTF-8
class User < ActiveRecord::Base
  has_many :registrations

  validates :name,  :presence => true
  validates :email, :presence => true, :uniqueness => true #, :email_format => true
  
  acts_as_authentic do |c|
    c.login_field = :email          # email is the login field
    c. validate_login_field = false # There is no login field, so don't validate it
  end
  
  def deliver_password_reset_instructions!  
    reset_perishable_token!  
    CodemocracyMailer.email_login(self).deliver  
  end

  def login!
    UserSession.create(self)
  end
end
