# encoding: UTF-8
class PasswordResetsController < ApplicationController
  before_filter :require_no_user

  def new
  end

  def show
    find_user_by_token_or_redirect_to_root
  end

  def update
    find_user_by_token_or_redirect_to_root
    @user.login!
    flash[:notice] = "Welcome #{@user.name}. You are now logged in."
    redirect_to root_url
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
  
  private
    def find_user_by_token_or_redirect_to_root
      @user = User.find_using_perishable_token(params[:id])
      unless @user
        flash[:notice] = "Sorry, could not log you in"
        redirect_to password_resets_path
      end
    end
end
