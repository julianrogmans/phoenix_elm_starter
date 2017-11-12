defmodule PhoenixElmStarterWeb.PageController do
  use PhoenixElmStarterWeb, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end

  def api_test(conn, _params) do
    json conn, %{hello: "World"}
  end
end
