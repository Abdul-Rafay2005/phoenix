import Config

config :todoist_clone,
  ecto_repos: [TodoistClone.Repo],
  generators: [timestamp_type: :utc_datetime]

# Configures the endpoint
config :todoist_clone, TodoistCloneWeb.Endpoint,
  url: [host: "localhost"],
  adapter: Bandit.PhoenixAdapter,
  render_errors: [
    formats: [html: TodoistCloneWeb.ErrorHTML, json: TodoistCloneWeb.ErrorJSON],
    layout: false
  ],
  pubsub_server: TodoistClone.PubSub,
  live_view: [signing_salt: "qLvEVjVm"]

# Configures the mailer 
config :todoist_clone, TodoistClone.Mailer,  adapter: Swoosh.Adapters.SMTP



# Configure esbuild (the version is required)
config :esbuild,
  version: "0.17.11",
  TodoistClone: [
    args:
      ~w(js/app.js --bundle --target=es2017 --outdir=../priv/static/assets --external:/fonts/* --external:/images/*),
    cd: Path.expand("../assets", __DIR__),
    env: %{"NODE_PATH" => Path.expand("../deps", __DIR__)}
  ]



config :tailwind, :todoist_clone,
  version: "4.0.9",
  args: ~w(
    --config=assets/tailwind.config.js
    --input=assets/css/app.css
    --output=priv/static/assets/app.css
  ),
  cd: Path.expand("../assets", __DIR__)


# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason


# Import environment-specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import Config

# Import environment-specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{config_env()}.exs"
