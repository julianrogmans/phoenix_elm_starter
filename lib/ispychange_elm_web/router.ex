defmodule IspychangeElmWeb.Router do
  use IspychangeElmWeb, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  if Mix.env == :dev do
    forward "/graphiql", Absinthe.Plug.GraphiQL, schema: IspychangeElmWeb.Schema
  end

  forward "/graphql", Absinthe.Plug,
    schema: IspychangeElmWeb.Schema

  scope "/", IspychangeElmWeb do
    pipe_through :browser # Use the default browser stack

    get "/", PageController, :index
  end

  # Other scopes may use custom stacks.
  # scope "/api", IspychangeElmWeb do
  #   pipe_through :api
  # end
end
