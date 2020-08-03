# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :admin,
  ecto_repos: [Admin.Repo]

# Configures the endpoint
config :admin, AdminWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "iaM0osUWnBxnNsH1l+XuKuJvkkka2dSjZL5lEsrMgE6Gx/TFT8nPz99NrBnt3AOZ",
  render_errors: [view: AdminWeb.ErrorView, accepts: ~w(html json), layout: false],
  pubsub_server: Admin.PubSub,
  live_view: [signing_salt: "6+GoBOG/"]

config :kaffy,
  otp_app: :admin,
  ecto_repo: Admin.Repo,
  router: AdminWeb.Router

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
