defmodule MyFirstApplication.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  def start(_type, _args) do
    children = [
      # Starts a worker by calling: PluralsightTweet.Worker.start_link(arg)
      # {MyFirstApplication.Worker, arg}
      #tell our application main module to launch our tweet server and supervisor
      MyFirstApplication.TweetServer, #doesn't take any params, just specify the module name.
      MyFirstApplication.Scheduler #need a config file for this child to work.
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: MyFirstApplication.Supervisor]
    Supervisor.start_link(children, opts)
  end
end
