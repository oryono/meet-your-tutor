defmodule MeetYourTutorWeb.Router do
  use MeetYourTutorWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  pipeline :auth do
    plug MeetYourTutorWeb.Auth.Pipeline
  end

  scope "/api", MeetYourTutorWeb do
    pipe_through :api

    post "/auth/login", AuthenticationController, :login
    post "/auth/register", AuthenticationController, :register

  end

  scope "/api", MeetYourTutorWeb do
    pipe_through [:api, :auth]

    get "/auth/current-user", AuthenticationController, :current_user
    resources "/categories", CategoryController, except: [:new, :edit]
    resources "/classes", ClassController, except: [:new, :edit]
    resources "/enrollments", EnrollmentController, except: [:new, :edit]
    resources "/users", UserController, except: [:new, :edit]
  end
end
