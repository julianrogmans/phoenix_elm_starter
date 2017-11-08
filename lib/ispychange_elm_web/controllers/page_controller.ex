defmodule IspychangeElmWeb.PageController do
  use IspychangeElmWeb, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end
