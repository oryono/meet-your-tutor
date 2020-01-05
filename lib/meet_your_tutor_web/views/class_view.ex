defmodule MeetYourTutorWeb.ClassView do
  use MeetYourTutorWeb, :view
  alias MeetYourTutorWeb.ClassView

  def render("index.json", %{classes: classes}) do
    %{data: render_many(classes, ClassView, "class.json")}
  end

  def render("show.json", %{class: class}) do
    %{data: render_one(class, ClassView, "class.json")}
  end

  def render("class.json", %{class: class}) do
    %{
      id: class.id,
      course_id: class.course_id,
      description: class.description,
      start_date: class.start_date,
      end_date: class.end_date,
      course_banner: class.course_banner,
    }
  end
end
