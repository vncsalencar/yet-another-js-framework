defmodule YajsfBackendWeb.Router do
  use YajsfBackendWeb, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_live_flash
    plug :put_root_layout, {YajsfBackendWeb.LayoutView, :root}
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]

    plug CORSPlug,
      origin: [
        "https://yajsf-front.up.railway.app",
        "http://yajsf-front.up.railway.app",
        "https://localhost:3000",
        "http://localhost:3000",
        "http://localhost",
        "https://localhost"
      ]
  end

  scope "/", YajsfBackendWeb do
    pipe_through :browser

    get "/", PageController, :index
  end

  scope "/" do
    pipe_through :browser
  end

  # Other scopes may use custom stacks.
  scope "/api", YajsfBackendWeb do
    pipe_through :api
    get "/ping", PingController, :index
    get "/strapi/liked", StrapiController, :liked
    get "/strapi/helpful", StrapiController, :helpful
    get "/strapi/trending", StrapiController, :trending
    get "/strapi/daily-quiz", StrapiController, :daily_quiz
  end

  pipeline :openapi do
    plug OpenApiSpex.Plug.PutApiSpec, module: YajsfBackendWeb.ApiSpec
  end

  scope "/api" do
    pipe_through :openapi
    get "/openapi", OpenApiSpex.Plug.RenderSpec, []
    get "/swaggerui", OpenApiSpex.Plug.SwaggerUI, path: "/api/openapi"
  end

  # Enables LiveDashboard only for development
  #
  # If you want to use the LiveDashboard in production, you should put
  # it behind authentication and allow only admins to access it.
  # If your application does not have an admins-only section yet,
  # you can use Plug.BasicAuth to set up some basic authentication
  # as long as you are also using SSL (which you should anyway).
  if Mix.env() in [:dev, :test] do
    import Phoenix.LiveDashboard.Router

    scope "/" do
      pipe_through :browser

      live_dashboard "/dashboard", metrics: YajsfBackendWeb.Telemetry
    end
  end

  # Enables the Swoosh mailbox preview in development.
  #
  # Note that preview only shows emails that were sent by the same
  # node running the Phoenix server.
  if Mix.env() == :dev do
    scope "/dev" do
      pipe_through :browser

      forward "/mailbox", Plug.Swoosh.MailboxPreview
    end
  end
end
