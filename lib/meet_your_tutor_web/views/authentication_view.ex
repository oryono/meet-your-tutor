defmodule MeetYourTutorWeb.AuthenticationView do
  use MeetYourTutorWeb, :view
  alias MeetYourTutorWeb.AuthenticationView

  def render("token.json", %{user: user, token: token}) do
    %{
      user: %{
        id: user.id,
        name: user.name,
        email: user.email,
      },
      token: token
    }
  end
end
