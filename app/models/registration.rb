# encoding: UTF-8
class Registration < ActiveRecord::Base
  belongs_to :user

  validates_presence_of :email, :name
  validates_format_of :email, :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i

  def create_and_login_user
    owner = User.create(:name => name, :email => email)
    return false unless owner.valid?
    update_attribute(:user_id, owner.id)
    owner.login!
  end
end