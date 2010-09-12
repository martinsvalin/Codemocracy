# encoding: UTF-8
class ProjectsController < ApplicationController
  before_filter :set_active_nav

  def index
  end

  def valkoll
    @next = {:action => :lokalpolitik, :text => "Lokalpolitik - vad bestäms nära dig?"}
  end
  
  def lokalpolitik
    @previous = {:action => :valkoll, :text => "Valkoll"}
    @next = {:action => :myndighetskoll, :text => "Myndighetskoll"}
  end
  
  def myndighetskoll
    @previous = {:action => :lokalpolitik, :text => "Lokalpolitik - vad bestäms nära dig?"}
    @next = {:action => :kollektivt, :text => "Kollektivt.se"}
  end
  
  def kollektivt
    @previous = {:action => :myndighetskoll, :text => "Myndighetskoll"}
    @next = {:action => :riksdagen_pa_facebook, :text => "Svenska Riksdagen på Facebook"}
  end
  
  def riksdagen_pa_facebook
    @previous = {:action => :kollektivt, :text => "Kollektivt.se"}
    @next = {:action => :engagemangsindex, :text => "Engagemangsindex"}
  end
  
  def engagemangsindex
    @previous = {:action => :riksdagen_pa_facebook, :text => "Svenska Riksdagen på Facebook"}
    @next = {:action => :boreda_at_codemocracy, :text => "Boreda @ Codemocracy"}
  end
  
  def boreda_at_codemocracy
    @previous = {:action => :engagemangsindex, :text => "Engagemangsindex"}
    @next = {:action => :crime_tracker, :text => "CrimeTracker"}
  end
  
  def crime_tracker
    @previous = {:action => :boreda_at_codemocracy, :text => "Boreda @ Codemocracy"}
    @next = {:action => :tagtider, :text => "Tågtider till Android"}
  end
  
  def tagtider
    @previous = {:action => :crime_tracker, :text => "CrimeTracker"}
    @next = {:action => :riksdagen_i_ply, :text => "Riksdagen i Ply"}
  end
  
  def riksdagen_i_ply
    @previous = {:action => :tagtider, :text => "Tågtider till Android"}
    @next = {:action => :georapport, :text => "Georapport"}
  end
  
  def georapport
    @previous = {:action => :riksdagen_i_ply, :text => "Riksdagsdata i Ply"}
    @next = {:action => :edemokrat, :text => "Edemokrat.se"}
  end
  
  def edemokrat
    @previous = {:action => :georapport, :text => "Georapport"}
  end
  
  private
    def set_active_nav
      @active_nav = "home"
    end
end
