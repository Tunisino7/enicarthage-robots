class TeamsController < ApplicationController
  before_action :set_team, only: [:show, :edit, :update, :destroy]

  # GET /teams
  # GET /teams.json
  def index
    @teams = Team.all
  end

  # GET /teams/1
  # GET /teams/1.json
  def show
    if current_team
      if ! (current_team.email == @team.email)
        redirect_to '/'
      end
    end
  end

  # GET /teams/new
  def new
    @team = Team.new

    @max = [0, 0, 0]

    @max[0] = Team.where(contest: 1).count
    @max[1] = Team.where(contest: 2).count
    @max[2] = Team.where(contest: 3).count
  end

  # GET /teams/1/edit
  def edit
    if current_team
      if ! (current_team.email == @team.email)
        redirect_to '/'
      end
    end
  end

  # POST /teams
  # POST /teams.json
  def create
    @max = [0, 0, 0]

    @max[0] = Team.where(contest: 1).count
    @max[1] = Team.where(contest: 2).count
    @max[2] = Team.where(contest: 3).count

    limit = [24, 1, 60]

    modified_params = team_params;
    modified_params[:active] = 0
    modified_params[:status] = 1
    modified_params[:date] = DateTime.now

    members = Team.where(contest: modified_params[:contest]).count

    if members
      if members < limit[modified_params[:contest].to_i - 1]
        @team = Team.new(modified_params)
        respond_to do |format|
          if @team.save
            session[:team_id] = @team.id
            format.html { redirect_to root_url, notice: 'Votre inscription est validée!' }
            format.json { render :show, status: :created, location: @team }
          else
            format.html { render :new }
            format.json { render json: @team.errors, status: :unprocessable_entity }
          end
        end
      elsif members < limit[modified_params[:contest].to_i - 1]*2 && members >= limit[modified_params[:contest].to_i - 1]
        modified_params[:status] = 0

        @team = Team.new(modified_params)
        rank = members - limit[modified_params[:contest].to_i - 1] + 1
        respond_to do |format|
          if @team.save
            session[:team_id] = @team.id
            format.html { redirect_to root_url, notice: "Vous êtes sur liste complémentaire au rang #{rank}" }
            format.json { render :show, status: :created, location: @team }
          else
            format.html { render :new }
            format.json { render json: @team.errors, status: :unprocessable_entity }
          end
        end

      else
        flash[:notice] = "Nous avons atteint le nombre maximum d'équipes autorisées!"
        redirect_to root_url
      end
    end
  end

  # PATCH/PUT /teams/1
  # PATCH/PUT /teams/1.json
  def update
    respond_to do |format|
      if @team.update(team_params)
        format.html { redirect_to @team, notice: 'Team was successfully updated.' }
        format.json { render :show, status: :ok, location: @team }
      else
        format.html { render :edit }
        format.json { render json: @team.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /teams/1
  # DELETE /teams/1.json
  def destroy
    @team.destroy
    respond_to do |format|
      format.html { redirect_to teams_url, notice: 'Team was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_team
    @team = Team.find(params[:id])
  end
  # Never trust parameters from the scary internet, only allow the white list through.
  def team_params
    params.require(:team).permit(:leader, :email, :password, :password_confirmation, :phone, :cin, :contest, :date, :robot, :university, :payment_proof, :member1, :member2, :member3, :member4, :member5, :member6, :member7, :status, :active)
  end
end
