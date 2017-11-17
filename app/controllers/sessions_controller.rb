class SessionsController < ApplicationController
  def payment
    @myteam = Team.find(current_team.id)
    if @myteam && params[:payment_proof]
      Team.where( id: current_team.id ).update_all( payment_proof: params[:payment_proof])
    end
  end
  def new
  end
  def create
    team = Team.find_by_email(params[:email])
    if team && team.authenticate(params[:password])
      session[:team_id] = team.id
      redirect_to '/myteam', notice: 'Logged in!'
    else
      render :new
    end
  end
  def destroy
    session[:team_id] = nil
    redirect_to root_url, notice: 'Logged out!'
  end
  def index
    @myteam = Team.find(current_team.id)
  end
end
