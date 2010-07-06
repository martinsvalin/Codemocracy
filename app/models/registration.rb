# encoding: UTF-8
class Registration < ActiveRecord::Base

  validates_presence_of :email, :name

end
