defmodule MeetYourTutorWeb.EnrollmentView do
  use MeetYourTutorWeb, :view
  alias MeetYourTutorWeb.EnrollmentView
  alias MeetYourTutorWeb.ClassView
  alias MeetYourTutorWeb.UserView

  def render("index.json", %{enrollments: enrollments}) do
    %{data: render_many(enrollments, EnrollmentView, "enrollment.json")}
  end

  def render("show.json", %{enrollment: enrollment}) do
    %{data: render_one(enrollment, EnrollmentView, "enrollment.json")}
  end

  def render("enrollment.json", %{enrollment: enrollment}) do
    %{id: enrollment.id,
      class: render_one(enrollment.class, ClassView, "class.json"),
      user: render_one(enrollment.user, UserView, "user.json")
    }
  end
end
