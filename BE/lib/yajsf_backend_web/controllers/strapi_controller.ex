defmodule YajsfBackendWeb.StrapiController do
  use YajsfBackendWeb, :controller

  @strapi_paths %{
    "liked" => "contents-we-liked",
    "helpful" => "helpful-materials"
  }

  def index(conn, %{"content-type" => content_type} = params) do
    limit = Map.get(params, "limit", 3)
    page = Map.get(params, "page", 0)

    strapi_url = System.fetch_env!("STRAPI_URL")
    strapi_token = System.fetch_env!("STRAPI_TOKEN")

    api_path = Map.get(@strapi_paths, content_type)

    request_url =
      "#{strapi_url}/api/#{api_path}" <>
        "?pagination[page]=#{page}" <>
        "&pagination[pageSize]=#{limit}"

    IO.puts(request_url)

    case HTTPoison.get(request_url, %{"Authorization" => "Bearer #{strapi_token}"}) do
      {:ok, %HTTPoison.Response{status_code: 200, body: body}} ->
        conn |> put_status(:ok) |> json(Jason.decode!(body))

      {:ok, %HTTPoison.Response{status_code: status_code, body: body}} ->
        conn |> put_status(status_code) |> json(Jason.decode!(body))

      {:error, %HTTPoison.Error{reason: reason}} ->
        conn
        |> put_status(:internal_server_error)
        |> json(%{"error" => "Internal server error", "reason" => reason})
    end
  end
end
