defmodule YajsfBackendWeb.PageController do
  use YajsfBackendWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
