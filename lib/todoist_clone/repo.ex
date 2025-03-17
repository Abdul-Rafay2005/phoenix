defmodule TodoistClone.Repo do
  use Ecto.Repo,
    otp_app: :TodoistClone,
    adapter: Ecto.Adapters.Postgres
end
