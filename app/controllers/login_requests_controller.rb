# encoding: UTF-8
class LoginRequestsController < ApplicationController
  before_filter :require_no_user

  def new
  end

  def show
    update
  end

  def update
    find_user_by_token_or_redirect
    @user.login!
    flash[:notice] = "Välkommen #{@user.name}. Du är nu inloggad."
    redirect_to root_url
  end

  def create  
    @user = User.find_by_email(params[:email])  
    if @user  
      @user.deliver_login_instructions!  
      flash[:notice] = "En inloggningslänk har skickats. Kolla din e-post."
      redirect_to root_url
    else  
      flash[:notice] = "Kunde inte hitta e-postadressen"  
      render :action => :new  
    end
  end
  
  private
    def find_user_by_token_or_redirect
      @user = User.find_using_perishable_token(params[:id])
      unless @user
        flash[:notice] = "Lyckades inte logga in."
        redirect_to login_requests_path
      end
    end
end
