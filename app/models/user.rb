# encoding: UTF-8
class User < ActiveRecord::Base
  has_many :registrations

  validates :name,  :presence => true
  validates :email, :presence => true, :uniqueness => true #, :email_format => true
  
  acts_as_authentic do |c|
    c.login_field = :email
    c.validate_login_field = false
    # c.account_mapping_mode :auto
    # c.account_merge_enabled true
  end
  
  def deliver_login_instructions!  
    reset_perishable_token!  
    CodemocracyMailer.email_login(self).deliver  
  end

  def login!
    UserSession.create(self)
  end
end
