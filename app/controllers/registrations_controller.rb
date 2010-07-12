# encoding: UTF-8
class RegistrationsController < ApplicationController
  # GET /registrations
  # GET /registrations.xml
  def index
    @registrations = Registration.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @registrations }
    end
  end

  # # GET /registrations/1
  # # GET /registrations/1.xml
  # def show
  #   @registration = Registration.find(params[:id])
  # 
  #   respond_to do |format|
  #     format.html # show.html.erb
  #     format.xml  { render :xml => @registration }
  #   end
  # end

  # GET /registrations/new
  # GET /registrations/new.xml
  def new
    @registration = Registration.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @registration }
    end
  end

  # GET /registrations/1/edit
  def edit
    @registration = Registration.find(params[:id])
  end

  # POST /registrations
  # POST /registrations.xml
  def create
    @registration = Registration.new(params[:registration])

    respond_to do |format|
      if @registration.save
        RegistrationMailer.registered(@registration).deliver
        
        format.html { redirect_to(edit_registration_path(@registration), :notice => t(:"registration.create.flash.success")) }
        format.xml  { render :xml => @registration, :status => :created, :location => @registration }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @registration.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /registrations/1
  # PUT /registrations/1.xml
  def update
    @registration = Registration.find(params[:id])

    respond_to do |format|
      if @registration.update_attributes(params[:registration])
        format.html { redirect_to(edit_registration_path(@registration), :notice => t(:"registration.update.flash.success")) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @registration.errors, :status => :unprocessable_entity }
      end
    end
  end

  # # DELETE /registrations/1
  # # DELETE /registrations/1.xml
  # def destroy
  #   @registration = Registration.find(params[:id])
  #   @registration.destroy
  # 
  #   respond_to do |format|
  #     format.html { redirect_to(registrations_url) }
  #     format.xml  { head :ok }
  #   end
  # end
end
