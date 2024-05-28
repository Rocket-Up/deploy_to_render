defmodule DeployToRender.Repo do
  use Ecto.Repo,
    otp_app: :deploy_to_render,
    adapter: Ecto.Adapters.Postgres
end
