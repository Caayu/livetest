# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :livetest,
  ecto_repos: [Livetest.Repo]

# Configures the endpoint
config :livetest, LivetestWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "UF0i1NdTDnJ5dvBsev0AxwYoBQe2ylmTeMetwoIpxzGcFHJflydyyQdHvMUk6NNi",
  render_errors: [view: LivetestWeb.ErrorView, accepts: ~w(html json), layout: false],
  pubsub_server: Livetest.PubSub,
  live_view: [signing_salt: "M6RZ6Yci"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
