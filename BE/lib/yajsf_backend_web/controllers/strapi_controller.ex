defmodule YajsfBackendWeb.StrapiController do
  use YajsfBackendWeb, :controller
  use OpenApiSpex.ControllerSpecs
  alias YajsfBackendWeb.Schemas.{ContentWeLiked, HelpfulMaterial}

  @strapi_paths %{
    "liked" => "contents-we-liked",
    "helpful" => "helpful-materials"
  }

  tags ["users"]

  operation :liked,
    summary: "Content we liked",
    responses: [
      ok: {"ContentWeLiked", "application/json", ContentWeLiked}
    ]

  def liked(conn, params) do
    case request_strapi_content("liked", params) do
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

  defp request_strapi_content(content_type, params) do
    page_size = Map.get(params, "page_size", 3)
    page = Map.get(params, "page", 0)

    strapi_url = System.fetch_env!("STRAPI_URL")
    strapi_token = System.fetch_env!("STRAPI_TOKEN")

    api_path = Map.get(@strapi_paths, content_type)

    request_url =
      "#{strapi_url}/api/#{api_path}" <>
        "?pagination[page]=#{page}" <>
        "&pagination[pageSize]=#{page_size}" <>
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
