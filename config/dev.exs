import Config

# Configure your database
config :todoist_clone, TodoistClone.Repo,
  username: "postgres",
  password: "postgres",
  hostname: "localhost",
  database: "todoist_clone_dev",
  stacktrace: true,
  show_sensitive_data_on_connection_error: true,
  pool_size: 10

# For development, we disable any cache and enable debugging and code reloading.
config :todoist_clone, TodoistCloneWeb.Endpoint,
  http: [ip: {127, 0, 0, 1}, port: 4000],
  check_origin: false,
  code_reloader: true,
  debug_errors: true,
  secret_key_base: "mhWFsPjVs3hnAl9jwZ6O6QrJOAeOhrWkXZ/5aYiSiaCctOrNwty44900RMGZb3+z",
  watchers: [
    esbuild: {Esbuild, :install_and_run, [:todoist_clone, ~w(--sourcemap=inline --watch)]},
    tailwind: {Tailwind, :install_and_run, [:todoist_clone, ~w(--watch)]}
  ],
  live_reload: [  # ✅ Moved live_reload inside the first config block
    patterns: [
      ~r"priv/static/(?!uploads/).*(js|css|png|jpeg|jpg|gif|svg)$",
      ~r"priv/gettext/.*(po)$",
      ~r"lib/todoist_clone_web/(controllers|live|components)/.*(ex|heex)$"
    ]
  ]

# Enable dev routes for dashboard and mailbox
config :todoist_clone, dev_routes: true

# Do not include metadata nor timestamps in development logs
config :logger, :console, format: "[$level] $message\n"

# Set a higher stacktrace during development. Avoid configuring such
# in production as building large stacktraces may be expensive.
config :phoenix, :stacktrace_depth, 20

# Initialize plugs at runtime for faster development compilation
config :phoenix, :plug_init_mode, :runtime

config :phoenix_live_view,
  debug_heex_annotations: true,
  enable_expensive_runtime_checks: true

# Disable swoosh api client as it is only required for production adapters.
config :swoosh, :api_client, false
