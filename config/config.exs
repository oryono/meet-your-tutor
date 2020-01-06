# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :meet_your_tutor,
  ecto_repos: [MeetYourTutor.Repo]

config :cors_plug,
       origin: ["*"],
       max_age: 86400

# Guardian config
config :meet_your_tutor, MeetYourTutorWeb.Guardian,
       issuer: "Meet Your Tutor",
       secret_key: "HoE+uw+zuJTz12ig6pGUuY5YiFuK0J/BTIpW2HanYj7luSyS4NbbYIAJZRK8uzDF"

# Configures the endpoint
config :meet_your_tutor, MeetYourTutorWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "85gjYAowTP6E2vGuJZPTu1Bb9vzlHRWrvMg0SPtc/Mbz9NSjbCw2ubdF46dCUDTy",
  render_errors: [view: MeetYourTutorWeb.ErrorView, accepts: ~w(json)],
  pubsub: [name: MeetYourTutor.PubSub, adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
