defmodule YajsfBackendWeb.StrapiController do
  require Logger
  use YajsfBackendWeb, :controller
  use OpenApiSpex.ControllerSpecs
  alias YajsfBackendWeb.Schemas.{ContentWeLiked, HelpfulMaterial, GitHubTrending}

  @strapi_paths %{
    "liked" => "contents-we-liked",
    "helpful" => "helpful-materials",
    "trending" => "github-trendings"
  }

  tags ["users"]

  operation :liked,
    summary: "Content we liked",
    responses: [
      ok: {"ContentWeLiked", "application/json", ContentWeLiked}
    ]

  def liked(conn, params) do
    sort = Map.get(params, "sort", "createdAt:desc")
    append_url = "&sort=#{sort}"

    case request_strapi_content("liked", params, append_url) do
      {:ok, %{"status_code" => status_code, "body" => body}} ->
        conn |> put_status(status_code) |> json(body)

      {:error, %{"reason" => reason}} ->
        conn
        |> put_status(:internal_server_error)
        |> json(%{"error" => "Internal server error", "reason" => reason})
    end
  end

  operation :helpful,
    summary: "Helpful materials",
    responses: [
      ok: {"HelpfulMaterial", "application/json", HelpfulMaterial}
    ]

  def helpful(conn, params) do
    case request_strapi_content("helpful", params) do
      {:ok, %{"status_code" => status_code, "body" => body}} ->
        conn |> put_status(status_code) |> json(body)

      {:error, %{"reason" => reason}} ->
        conn
        |> put_status(:internal_server_error)
        |> json(%{"error" => "Internal server error", "reason" => reason})
    end
  end

  operation :trending,
    summary: "GitHub Trending",
    responses: [
      ok: {"GitHubTrending", "application/json", GitHubTrending}
    ]

  def trending(conn, params) do
    sort = Map.get(params, "sort", "createdAt:desc")
    append_url = "&sort[1]=#{sort}" <> "&sort[0]=starsToday:desc"

    case request_strapi_content("trending", params, append_url) do
      {:ok, %{"status_code" => status_code, "body" => body}} ->
        conn |> put_status(status_code) |> json(body)

      {:error, %{"reason" => reason}} ->
        conn
        |> put_status(:internal_server_error)
        |> json(%{"error" => "Internal server error", "reason" => reason})
    end
  end

  def create_trendings(trendings) do
    api_path = Map.get(@strapi_paths, "trending")
    strapi_url = System.fetch_env!("STRAPI_URL")
    strapi_token = System.fetch_env!("STRAPI_TOKEN")

    request_url = "#{strapi_url}/api/#{api_path}"

    Enum.each(trendings, fn trending ->
      body = Jason.encode!(%{"data" => trending})
      IO.inspect(body)

      case HTTPoison.post(request_url, body, %{
             "Authorization" => "Bearer #{strapi_token}",
             "Content-type" => "application/json"
           }) do
        {:ok, response} ->
          Logger.debug("GitHubTrending creation response")
          IO.inspect(response.body)

        {:error, reason} ->
          Logger.debug("Could not create trending.", %{"reason" => reason, "payload" => trending})
      end
    end)
  end

  defp strip(object) do
    case object do
      %{"data" => data, "meta" => meta} ->
        %{"data" => strip(data), "meta" => meta}

      %{"data" => data} ->
        strip(data)

      %{"attributes" => attributes, "id" => id} ->
        Map.put(strip(attributes), "id", id)

      %{} ->
        Map.new(object, fn {k, v} -> {k, strip(v)} end)

      [_ | _] ->
        Enum.map(object, fn v -> strip(v) end)

      _ ->
        object
    end
  end

  defp request_strapi_content(content_type, params, append_url \\ "") do
    page_size = Map.get(params, "page_size", 3)
    page = Map.get(params, "page", 0)

    strapi_url = System.fetch_env!("STRAPI_URL")
    strapi_token = System.fetch_env!("STRAPI_TOKEN")

    api_path = Map.get(@strapi_paths, content_type)

    request_url =
      "#{strapi_url}/api/#{api_path}" <>
        "?pagination[page]=#{page}" <>
        "&pagination[pageSize]=#{page_size}" <>
        append_url <>
        "&populate=*"

    case HTTPoison.get(request_url, %{"Authorization" => "Bearer #{strapi_token}"}) do
      {:ok, %HTTPoison.Response{status_code: 200, body: body}} ->
        decoded = Jason.decode!(body)
        {:ok, %{"status_code" => 200, "body" => strip(decoded)}}

      {:ok, %HTTPoison.Response{status_code: status_code, body: body}} ->
        {:ok, %{"status_code" => status_code, "body" => body}}

      {:error, %HTTPoison.Error{reason: reason}} ->
        {:error, %{"reason" => reason}}
    end
  end
end
