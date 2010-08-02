# encoding: UTF-8
class Registration < ActiveRecord::Base
  belongs_to :user

  validates_presence_of :email, :name
  validates_format_of :email, :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i

  def set_and_login_user
    user = User.create(:name => name, :email => email)
    return false unless user.valid?
    save
    user.login!
  end
end