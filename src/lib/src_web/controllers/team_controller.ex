defmodule SrcWeb.TeamController do
  use SrcWeb, :controller

  alias Src.Users
  alias Src.Users.Team

  action_fallback SrcWeb.FallbackController

  def index(conn, _params) do
    teams = Users.list_teams()
    render(conn, "index.json", teams: teams)
  end

  def create(conn, team_params) do
    #IO.inspect(team_params)
    with {:ok, %Team{} = team} <- Users.create_team(team_params) do
      conn
      |> put_status(:created)
      #|> put_resp_header("location", Routes.team_path(conn, :show, team))
      |> render("show.json", team: team)
    end
  end

  def get_all_by_user(conn, %{"user_id"=> user_id}) do
    teams = Users.get_team_by_user_id(user_id)
    conn
    |> put_status(:ok)
    |> json(teams)
  end


  def get_team(conn, params) do
    team = Users.get_team_by_user_and_team_id(params)
    render(conn, "show.json", team: team)
  end
  # def show(conn, %{"id" => id}) do
  #   team = Users.get_team!(id)
  #   render(conn, "show.json", team: team)
  # end

  def get_member_teams(conn, %{"member_id"=>member_id}) do
    teams = Users.get_teams_by_member(member_id)
    conn
    |> put_status(:ok)
    |> json(teams)
  end

  def update(conn, %{"id" => id, "team" => team_params}) do
    team = Users.get_team!(id)

    with {:ok, %Team{} = team} <- Users.update_team(team, team_params) do
      render(conn, "show.json", team: team)
    end
  end

  def delete(conn, %{"id" => id}) do
    team = Users.get_team!(id)

    with {:ok, %Team{}} <- Users.delete_team(team) do
      send_resp(conn, :no_content, "")
    end
  end
end
