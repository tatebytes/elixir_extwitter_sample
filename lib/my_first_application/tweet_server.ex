#this is a generic server, it is a way to send messages to a process.
#it's a way to ensure that if our process died, we will be able to restart it.
defmodule MyFirstApplication.TweetServer do
#using "use" statements like this will inject code into our module at compile time
  use GenServer #GenServers are behaviours that define a set of functions to
  #be implemented by a module.
  #Ensure that a module implements ALL functions in that set
  #Analogous to an interface in a traditional OO language
  #for GenServers, we have 2 functions that we have to define: init and start_link.
  def start_link(_) do
    GenServer.start_link(__MODULE__, :ok, name: :tweet_server)
  end

  def init(:ok) do
    {:ok, %{}} #second parameter is the initial state of the paramter. for this application,
    #our server is not going to worry about state, and instead, it's going to send out tweets over time.
  end

  def handle_cast({:tweet, tweet}, _) do #handle_cast is asynchronous, handle_call is synchronous
    MyFirstApplication.Tweet.send(tweet)
    {:noreply, %{}} #return a tuple with :noreply atom, and the state of the server (in our case, an empty map)
  end

  def tweet(tweet) do #allows consumer to do a tweet call without needing to find out the params of the handle_cast
    GenServer.cast(:tweet_server, {:tweet, tweet})
  end
end
