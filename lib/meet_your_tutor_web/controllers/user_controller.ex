defmodule MeetYourTutorWeb.UserController do
  use MeetYourTutorWeb, :controller

  alias MeetYourTutor.Repo

  alias MeetYourTutor.Accounts
  alias MeetYourTutor.Accounts.User

  action_fallback MeetYourTutorWeb.FallbackController

  def index(conn, _params) do
    users = Accounts.list_users() |> Repo.preload(:classes)
    render(conn, "index.json", users: users)
  end

  def create(conn, %{"user" => user_params}) do
    with {:ok, %User{} = user} <- Accounts.create_user(user_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", Routes.user_path(conn, :show, user))
      |> render("show.json", user: user)
    end
  end

  def show(conn, %{"id" => id}) do
    user = Accounts.get_user!(id) |> Repo.preload([classes: [:user]])
    render(conn, "show.json", user: user)
  end

  def update(conn, %{"id" => id, "user" => user_params}) do
    user = Accounts.get_user!(id)

    with {:ok, %User{} = user} <- Accounts.update_user(user, user_params) do
      render(conn, "show.json", user: user)
    end
  end

  def delete(conn, %{"id" => id}) do
    user = Accounts.get_user!(id)

    with {:ok, %User{}} <- Accounts.delete_user(user) do
      send_resp(conn, :no_content, "")
    end
  end

  def user_classes(conn,  %{"id" => id}) do
      user = Accounts.get_user!(id) |> Repo.preload(:classes)
      classes = user.classes
      IO.puts "*********"
      IO.inspect classes
      IO.puts "*********"
      conn
      |> put_view(MeetYourTutorWeb.ClassView)
      |> render("classes.json", classes: classes)


  end
end
