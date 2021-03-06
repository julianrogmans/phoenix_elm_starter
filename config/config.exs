# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :phoenix_elm_starter,
  ecto_repos: [PhoenixElmStarter.Repo]

# Configures the endpoint
config :phoenix_elm_starter, PhoenixElmStarterWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "cVWqKEo/WOwBIlHjYt59aHtZzapCUr7o7MLS9edpp4vubVbSGt+JUyy0eUwSndgL",
  render_errors: [view: PhoenixElmStarterWeb.ErrorView, accepts: ~w(html json)],
  pubsub: [name: PhoenixElmStarter.PubSub,
           adapter: Phoenix.PubSub.PG2]

config :phoenix_elm_starter, PhoenixElmStarterWeb.Guardian,
  issuer: "phoenix_elm_starter",
  secret_key: "0ysU/tQz24smo0qqZ4Kki/QXCb7U0MEhvEiEhkTr45lTkCpcPfHUpTsf2KM7E/T5"

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
