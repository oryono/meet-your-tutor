defmodule MeetYourTutorWeb.ClassController do
  use MeetYourTutorWeb, :controller

  alias MeetYourTutor.Courses
  alias MeetYourTutor.Courses.Class
  alias MeetYourTutor.Repo

  action_fallback MeetYourTutorWeb.FallbackController

  def index(conn, _params) do
    classes = Courses.list_classes() |> Repo.preload(:user)
    render(conn, "index.json", classes: classes)
  end

  def create(conn, %{"class" => class_params}) do
    class_params = Map.put(class_params, "user_id", Guardian.Plug.current_resource(conn).id)

    with {:ok, %Class{} = class} <- Courses.create_class(class_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", Routes.class_path(conn, :show, class))
      |> render("show.json", class: class)
    end
  end

  def show(conn, %{"id" => id}) do
    class = Courses.get_class!(id) |> Repo.preload([user: [:classes]])
    render(conn, "show.json", class: class)
  end

  def update(conn, %{"id" => id, "class" => class_params}) do
    class = Courses.get_class!(id)

    with {:ok, %Class{} = class} <- Courses.update_class(class, class_params) do
      render(conn, "show.json", class: class)
    end
  end

  def delete(conn, %{"id" => id}) do
    class = Courses.get_class!(id)

    with {:ok, %Class{}} <- Courses.delete_class(class) do
      send_resp(conn, :no_content, "")
    end
  end
end
