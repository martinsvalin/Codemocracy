# encoding: UTF-8
class UsersController < ApplicationController
  before_filter :require_user

  def show
    @user = User.find(params[:id])
    render :action => :edit
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])

    if @user.update_attributes(params[:user])
      redirect_to(edit_user_path(@user), :notice => 'Profile updated.')
    else
      render :action => :edit
    end
  end

  # def add_rpx_auth
  #   @user = current_user
  #   if @user.save
  #     flash[:notice] = "Successfully added RPX authentication for this account."
  #   else
  #     flash[:notice] = "Nope, didn't work. Sorry."
  #   end
  #   redirect_to edit_user_path(@user)
  # end
end
