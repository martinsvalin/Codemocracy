# encoding: UTF-8
class RegistrationsController < ApplicationController
  before_filter :set_active_nav, :only => [:show, :new, :edit,]

  def show
    redirect_to edit_registration_path(params[:id])
  end

  def new
    @registration = Registration.new
  end

  def edit
    @registration = Registration.find(params[:id])
    require_owner
  end

  def create
    @registration = Registration.new(params[:registration])
    @registration.user = current_user if current_user

    if @registration.save
      @registration.user.try(:login!) unless current_user
      CodemocracyMailer.registered(@registration).deliver
      redirect_to(edit_registration_path(@registration), :notice => t(:"registration.create.flash.success"))
    else
      render :action => "new"
    end
  end

  def update
    @registration = Registration.find(params[:id])
    require_owner

    if @registration.update_attributes(params[:registration])
      redirect_to(edit_registration_path(@registration), :notice => t(:"registration.update.flash.success"))
    else
      render :action => "edit"
    end
  end

  private
    def set_active_nav
      @active_nav = 'register'
    end

    def require_owner
      unless current_user == @registration.user
        store_location
        alert_msg = current_user ? 
          "Du har inte behörighet till #{session[:return_to]}" : 
          "Du måste vara inloggad för att kunna nå #{session[:return_to]}"
        redirect_to root_url, :alert => alert_msg
      end
    end
end
