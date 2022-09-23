defmodule YajsfBackend.GithubTrending do
  require Logger
  require YajsfBackendWeb.StrapiController

  def fetch_trending_page(language) do
    base_url = "https://github.com/trending/#{language}?since=daily&spoken_language_code=en"

    case HTTPoison.get(base_url) do
      {:ok, %HTTPoison.Response{status_code: 200, body: body}} ->
        {:ok, body}

      {:ok, %HTTPoison.Response{status_code: status_code}} ->
        IO.puts("Status code = #{status_code} :(")
        {:error}

      {:error, %HTTPoison.Error{reason: reason}} ->
        {:error}
    end
  end

  defp extract_articles(document, nth, articles \\ []) do
    article = Floki.find(document, "main article:nth-of-type(#{nth})")

    case Enum.count(article) do
      1 ->
        title =
          Floki.find(article, "h1 a")
          |> Floki.text()
          |> String.trim()
          |> String.split("/")
          |> Enum.map_join("/", fn t -> t |> String.trim() end)

        description = Floki.find(article, "p") |> Floki.text() |> String.trim()

        language =
          Floki.find(article, "span[itemprop='programmingLanguage']")
          |> Floki.text()
          |> String.trim()

        stars =
          Floki.find(article, "div.f6.mt-2.color-fg-muted a:nth-child(2)")
          |> Floki.text()
          |> String.trim()
          |> String.replace(",", "")
          |> String.to_integer()

        forks =
          Floki.find(article, "div.f6.mt-2.color-fg-muted a:nth-child(3)")
          |> Floki.text()
          |> String.trim()
          |> String.replace(",", "")
          |> String.to_integer()

        stars_today =
          Floki.find(article, "div.f6.mt-2.color-fg-muted span:nth-child(5)")
          |> Floki.text()
          |> String.split("stars")
          |> Enum.at(0)
          |> String.trim()
          |> String.to_integer()

        article = %{
          "title" => title,
          "description" => description,
          "language" => language,
          "stars" => stars,
          "starsToday" => stars_today,
          "forks" => forks
        }

        extract_articles(document, nth + 1, articles ++ [article])

      0 ->
        articles
    end
  end

  def get_trending_repos(language) do
    {:ok, source} = fetch_trending_page(language)
    {:ok, document} = Floki.parse_document(source)
    articles = extract_articles(document, 1)
    articles
  end

  def sync_task do
    javascript_repos = get_trending_repos("javascript")
    typescript_repos = get_trending_repos("typescript")

    task_result =
      YajsfBackendWeb.StrapiController.create_trendings(javascript_repos ++ typescript_repos)

    Logger.debug("`CreateTrendings` task result", task_result)
  end
end
