import Config

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :yajsf_backend, YajsfBackendWeb.Endpoint,
  http: [ip: {127, 0, 0, 1}, port: 4002],
  secret_key_base: "7GViLrTbpqrcfX6aYBTiYXXjjOtw0p3gUcDaZhbqtKernkzhII2Bkjsh72W8o8Sl",
  server: false

# In test we don't send emails.
config :yajsf_backend, YajsfBackend.Mailer,
  adapter: Swoosh.Adapters.Test

# Print only warnings and errors during test
config :logger, level: :warn

# Initialize plugs at runtime for faster test compilation
config :phoenix, :plug_init_mode, :runtime
