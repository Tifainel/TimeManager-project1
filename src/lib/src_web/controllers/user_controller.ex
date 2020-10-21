defmodule SrcWeb.UserController do
  use SrcWeb, :controller

  alias Src.Users
  alias Src.Users.User

  action_fallback SrcWeb.FallbackController

  def index(conn, params) do
    #users = Users.list_users()
    #IO.inspect(users);
    # render(conn, "index.json", users: users)

    user = Users.get_user_by_email_and_username(params)
    #IO.puts(params["email"])
    #IO.inspect(user)
    render(conn, "user.json", user: user)
  end

  def create(conn, %{"user" => user_params}) do
    #%{"email" => "mymail@tezst.fr", "username" => "aymerizzck"}
    IO.inspect(user_params)
    with {:ok, %User{} = user} <- Users.create_user(user_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", Routes.user_path(conn, :show, user))
      |> render("show.json", user: user)
    end
  end

  # def get_one_user_by_email_and_username(conn, params) do
  #   user = Users.get_user_by_email_and_username(params)
  #   render(conn, "show.json", user: user)
  # end

  def show(conn, %{"id" => id}) do
    user = Users.get_user!(id)
    IO.inspect(user)
    render(conn, "show.json", user: user)
  end

  def update(conn, %{"id" => id, "user" => user_params}) do
    user = Users.get_user!(id)

    with {:ok, %User{} = user} <- Users.update_user(user, user_params) do
      render(conn, "show.json", user: user)
    end
  end

  def delete(conn, %{"id" => id}) do
    user = Users.get_user!(id)

    with {:ok, %User{}} <- Users.delete_user(user) do
      send_resp(conn, :no_content, "")
    end
  end
end
