defmodule PhoenixElmStarterWeb.Router do
  use PhoenixElmStarterWeb, :router

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

  forward "/graphql", Absinthe.Plug, schema: PhoenixElmStarterWeb.Schema
  forward "/graphiql", Absinthe.Plug.GraphiQL, schema: PhoenixElmStarterWeb.Schema

  scope "/", PhoenixElmStarterWeb do
    pipe_through :browser # Use the default browser stack
    
    get "/", PageController, :index
    get "/:page", PageController, :index
  end
  # Other scopes may use custom stacks.
  # scope "/api", PhoenixElmStarterWeb do
  #   pipe_through :api
  # end
end
