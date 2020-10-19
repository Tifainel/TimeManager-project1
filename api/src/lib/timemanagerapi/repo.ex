defmodule Timemanagerapi.Repo do
  use Ecto.Repo,
    otp_app: :timemanagerapi,
    adapter: Ecto.Adapters.Postgres
end
