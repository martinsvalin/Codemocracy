# encoding: utf-8
class UsersController < ApplicationController
  def create
    @user = User.new params[:user]
    if @user.save
      redirect_to root_path, :notice => "Du är nu anmäld med adressen #{@user.email}. Trevligt!"
    else
      redirect_to root_path, :error => "Fan också"
    end
  end
end
