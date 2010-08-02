# encoding: UTF-8
class Registration < ActiveRecord::Base
  belongs_to :user
  after_save :set_user

  validates_presence_of :email, :name
  validates_format_of :email, :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i

  def set_user
    unless user 
      new_user = User.create(:name => name, :email => email)
      update_attribute(:user_id, new_user.id) if new_user.valid?
    end
  end
end