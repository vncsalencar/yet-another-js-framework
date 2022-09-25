import Config

config :yajsf_backend,
  strapi_url: System.fetch_env!("STRAPI_URL"),
  strapi_token: System.fetch_env!("STRAPI_TOKEN")
