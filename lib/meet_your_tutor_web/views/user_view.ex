defmodule MeetYourTutorWeb.UserView do
  use MeetYourTutorWeb, :view
  alias MeetYourTutorWeb.UserView
  alias MeetYourTutorWeb.ClassView

  def render("index.json", %{users: users}) do
    %{data: render_many(users, UserView, "user_with_classes.json")}
  end

  def render("show.json", %{user: user}) do
    %{data: render_one(user, UserView, "user_with_classes.json")}
  end

  def render("user_with_classes.json", %{user: user}) do
    %{
      id: user.id,
      name: user.name,
      email: user.email,
      classes: render_many(user.classes, ClassView, "class.json")
    }
  end

  def render("user.json", %{user: user}) do
    %{
      id: user.id,
      name: user.name,
      email: user.email,
    }
  end
end
