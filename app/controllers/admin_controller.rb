class AdminController < ApplicationController
  def dashboard
     @teams = Team.where(contest: params[:contests])
  end
  def login
  end

  def check
    if params[:name] == 'tunisino' && params[:password] == '123'
      flash[:info] = "Bienvenue Admin !"
      session[:name] = "tunisino"
      session[:password] = "123"
      redirect_to "/admin/dashboard"
    else
      flash[:info] = "Échec de la connexion"
      session[:name] = nil
      session[:password] = nil
      redirect_to "/admin/"
    end
  end
  def update
    @actualteam = Team.where(id: params[:activatedteam].to_i)

    Team.where(id: params[:activatedteam].to_i ).update_all( active: 1 )
    redirect_to "/teams/#{params[:activatedteam].to_i}"

  end
end
