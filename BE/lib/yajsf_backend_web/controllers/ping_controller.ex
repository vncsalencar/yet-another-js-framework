defmodule YajsfBackendWeb.PingController do
  use YajsfBackendWeb, :controller

  def index(conn, _params) do
    json(conn, %{response: "pong"})
  end
end
