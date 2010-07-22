# encoding: UTF-8
class InfoController < ApplicationController

  def program
    @active_nav = 'program'
  end
  
  def about
    @active_nav = 'about'
  end
  
  def inspiration
    @active_nav = 'inspiration'
  end
end
