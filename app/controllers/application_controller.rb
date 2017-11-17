class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  private
  def team_page
    team_page = params[:p]
  end
  def current_contest
    current_contest = params[:id]
  end
  def current_team
    Team.where(id: session[:team_id]).first
  end
  helper_method :current_team
  helper_method :current_contest
  helper_method :team_page
end
