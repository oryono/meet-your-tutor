defmodule MeetYourTutorWeb.AuthenticationController do
  use MeetYourTutorWeb, :controller

  alias MeetYourTutor.Accounts
  alias MeetYourTutor.Accounts.User
  alias MeetYourTutorWeb.UserView

  action_fallback MeetYourTutorWeb.FallbackController

  def login(conn, %{"email" => email, "password" => password}) do
    case Accounts.login(email, password) do
      {:ok, user} ->
        {:ok, token, _} = MeetYourTutorWeb.Guardian.encode_and_sign(user)
        render(conn, "token.json", user: user, token: token)
      :error ->
        conn
        |> put_status(:unauthorized)
        |> json(%{message: "Invalid Credentials"})
    end
  end

  def login(conn, %{}) do
    conn
    |> put_status(:bad_request)
    |> json(%{message: "Please enter your credentials"})
  end

  def register(conn, %{} = params) do
    with {:ok, %User{} = user} <- Accounts.create_user(params),
         {:ok, token, _} = MeetYourTutorWeb.Guardian.encode_and_sign(user) do
      conn
      |> put_status(:created)
      |> render("token.json", %{user: user, token: token})
    end
  end

  def current_user(conn, _params) do
    user = Guardian.Plug.current_resource(conn)
    conn
    |> put_view(UserView)
    |> render("user.json", user: user)
  end
end
