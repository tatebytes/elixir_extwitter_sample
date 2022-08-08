use Mix.Config
#config Quantum for our scheduler.
#config: name of our application, name of the module that has our scheduler.
config :my_first_application, MyFirstApplication.Scheduler, jobs: [
  #Quantum allows you to define multiple jobs that all operate on their own interval
  #We only need one, and we want it to be every minute.
  #this job will grab a random tweet and then send it out to our TweetServer.
    {"* * * *", fn ->
      MyFirstApplication.FileReader.get_strings_to_tweet(
        Path.join("#{:code.priv_dir(:my_first_application)}", "sample.txt")
      )
      |> MyFirstApplication.TweetServer.tweet
    end }
]
