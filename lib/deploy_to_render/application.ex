defmodule DeployToRender.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      # Start the Telemetry supervisor
      DeployToRenderWeb.Telemetry,
      # Start the Ecto repository
      DeployToRender.Repo,
      # Start the PubSub system
      {Phoenix.PubSub, name: DeployToRender.PubSub},
      # Start Finch
      {Finch, name: DeployToRender.Finch},
      # Start the Endpoint (http/https)
      DeployToRenderWeb.Endpoint
      # Start a worker by calling: DeployToRender.Worker.start_link(arg)
      # {DeployToRender.Worker, arg}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: DeployToRender.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    DeployToRenderWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
