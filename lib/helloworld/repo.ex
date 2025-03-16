defmodule Helloworld.Repo do
  use Ecto.Repo,
    otp_app: :helloworld,
    adapter: Ecto.Adapters.Postgres
end
