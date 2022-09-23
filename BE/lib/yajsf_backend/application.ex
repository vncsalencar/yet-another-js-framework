defmodule YajsfBackend.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      # Start the Telemetry supervisor
      YajsfBackendWeb.Telemetry,
      # Start the PubSub system
      {Phoenix.PubSub, name: YajsfBackend.PubSub},
      # Start the Endpoint (http/https)
      YajsfBackendWeb.Endpoint,
      # Start a worker by calling: YajsfBackend.Worker.start_link(arg)
      # {YajsfBackend.Worker, arg}
      YajsfBackend.Scheduler
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: YajsfBackend.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    YajsfBackendWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
