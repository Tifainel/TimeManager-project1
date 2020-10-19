defmodule TimemanagerapiWeb.PageController do
  use TimemanagerapiWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
