defmodule MeetYourTutorWeb.EnrollmentView do
  use MeetYourTutorWeb, :view
  alias MeetYourTutorWeb.EnrollmentView

  def render("index.json", %{enrollments: enrollments}) do
    %{data: render_many(enrollments, EnrollmentView, "enrollment.json")}
  end

  def render("show.json", %{enrollment: enrollment}) do
    %{data: render_one(enrollment, EnrollmentView, "enrollment.json")}
  end

  def render("enrollment.json", %{enrollment: enrollment}) do
    %{id: enrollment.id,
      course_id: enrollment.course_id,
      user_id: enrollment.user_id}
  end
end
