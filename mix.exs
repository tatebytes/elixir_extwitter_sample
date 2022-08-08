defmodule MyFirstApplication.MixProject do
  use Mix.Project

  def project do
    [
      app: :my_first_application,
      version: "0.1.0",
      elixir: "~> 1.13.4-otp-25",
      start_permanent: Mix.env() == :prod, #start_permanent tells Erlang to crash if the supervision tree shuts down.
      deps: deps()
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_appications: [:logger],
      mod: {MyFirstApplication.Application, []} #second param is the list of params to pass to the module

    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:credo, "~> 1.2"},
      {:quantum, "~> 2.4"},
      {:oauther, "~> 1.1"},
      {:jason, "~> 1.1"},
      {:extwitter, "~> 0.12.0"},
    ]
  end
end
#mix new pluralsight_tweet --sup
