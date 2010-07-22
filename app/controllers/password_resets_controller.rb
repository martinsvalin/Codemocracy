# encoding: UTF-8
class PasswordResetsController < ApplicationController
  def new
  end

  def create  
    @user = User.find_by_email(params[:email])  
    if @user  
      @user.deliver_password_reset_instructions!  
      flash[:notice] = "A login link has been emailed to you.<br />Please check your email.".html_safe
      redirect_to root_url  
    else  
      flash[:notice] = "No such email address could be found"  
      render :action => :new  
    end
  end
end
