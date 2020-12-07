defmodule Livetest.Repo do
  use Ecto.Repo,
    otp_app: :livetest,
    adapter: Ecto.Adapters.Postgres
end
