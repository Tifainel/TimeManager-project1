# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :timemanagerapi,
  ecto_repos: [Timemanagerapi.Repo]

# Configures the endpoint
config :timemanagerapi, TimemanagerapiWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "cXQQ+PM8bHGCf78d7y8Fm1Aj/LXgbNVRWyF18feM49YVpMPSKlJVxLlBzkfYqQe0",
  render_errors: [view: TimemanagerapiWeb.ErrorView, accepts: ~w(html json), layout: false],
  pubsub_server: Timemanagerapi.PubSub,
  live_view: [signing_salt: "rRFvwnfk"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
