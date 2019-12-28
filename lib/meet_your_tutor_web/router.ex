defmodule MeetYourTutorWeb.Router do
  use MeetYourTutorWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/api", MeetYourTutorWeb do
    pipe_through :api

    post "/auth/login", AuthenticationController, :login
    post "/auth/register", AuthenticationController, :register
  end
end
