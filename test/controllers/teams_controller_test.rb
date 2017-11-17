require 'test_helper'

class TeamsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @team = teams(:one)
  end

  test "should get index" do
    get teams_url
    assert_response :success
  end

  test "should get new" do
    get new_team_url
    assert_response :success
  end

  test "should create team" do
    assert_difference('Team.count') do
      post teams_url, params: { team: { active: @team.active, cin: @team.cin, contest: @team.contest, date: @team.date, email: @team.email, leader: @team.leader, member1: @team.member1, member2: @team.member2, member3: @team.member3, member4: @team.member4, member5: @team.member5, member6: @team.member6, member7: @team.member7, password: 'secret', password_confirmation: 'secret', payment_proof: @team.payment_proof, phone: @team.phone, robot: @team.robot, status: @team.status, university: @team.university } }
    end

    assert_redirected_to team_url(Team.last)
  end

  test "should show team" do
    get team_url(@team)
    assert_response :success
  end

  test "should get edit" do
    get edit_team_url(@team)
    assert_response :success
  end

  test "should update team" do
    patch team_url(@team), params: { team: { active: @team.active, cin: @team.cin, contest: @team.contest, date: @team.date, email: @team.email, leader: @team.leader, member1: @team.member1, member2: @team.member2, member3: @team.member3, member4: @team.member4, member5: @team.member5, member6: @team.member6, member7: @team.member7, password: 'secret', password_confirmation: 'secret', payment_proof: @team.payment_proof, phone: @team.phone, robot: @team.robot, status: @team.status, university: @team.university } }
    assert_redirected_to team_url(@team)
  end

  test "should destroy team" do
    assert_difference('Team.count', -1) do
      delete team_url(@team)
    end

    assert_redirected_to teams_url
  end
end
