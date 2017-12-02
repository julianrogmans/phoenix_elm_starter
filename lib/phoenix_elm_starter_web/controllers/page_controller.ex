defmodule PhoenixElmStarterWeb.PageController do
  use PhoenixElmStarterWeb, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end
