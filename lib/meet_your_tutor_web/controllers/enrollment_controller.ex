defmodule MeetYourTutorWeb.EnrollmentController do
  use MeetYourTutorWeb, :controller

  alias MeetYourTutor.Repo
  alias MeetYourTutor.Courses
  alias MeetYourTutor.Courses.Enrollment

  action_fallback MeetYourTutorWeb.FallbackController

  def index(conn, _params) do
    enrollments = Courses.list_enrollments() |> Repo.preload([:class, :user])
    render(conn, "index.json", enrollments: enrollments)
  end

  def create(conn, %{"enrollment" => enrollment_params}) do
    enrollment_params = Map.put(enrollment_params, "user_id", Guardian.Plug.current_resource(conn).id)
    with {:ok, %Enrollment{} = enrollment } <- Courses.create_enrollment(enrollment_params) do
      enrollment = enrollment |> Repo.preload([:class, :user])
      conn
      |> put_status(:created)
      |> put_resp_header("location", Routes.enrollment_path(conn, :show, enrollment))
      |> render("show.json", enrollment: enrollment)
    end
  end

  def show(conn, %{"id" => id}) do
    enrollment = Courses.get_enrollment!(id)
    render(conn, "show.json", enrollment: enrollment)
  end

  def update(conn, %{"id" => id, "enrollment" => enrollment_params}) do
    enrollment = Courses.get_enrollment!(id)

    with {:ok, %Enrollment{} = enrollment} <- Courses.update_enrollment(enrollment, enrollment_params) do
      render(conn, "show.json", enrollment: enrollment)
    end
  end

  def delete(conn, %{"id" => id}) do
    enrollment = Courses.get_enrollment!(id)

    with {:ok, %Enrollment{}} <- Courses.delete_enrollment(enrollment) do
      send_resp(conn, :no_content, "")
    end
  end
end
