# encoding: UTF-8
class InfoController < ApplicationController

  def program
    @active_nav = 'program'
  end

  def home
    @active_nav = 'home'
  end
  
  def about
    @active_nav = 'about'
  end
  
  def inspiration
    @active_nav = 'inspiration'
  end
end
