defmodule YajsfBackend.Env do
  def env(key) do
    Application.fetch_env!(:yajsf_backend, key)
  end
end
