defmodule MeetYourTutorWeb.ClassView do
  use MeetYourTutorWeb, :view
  alias MeetYourTutorWeb.ClassView
  alias MeetYourTutorWeb.UserView

  def render("index.json", %{classes: classes}) do
    %{data: render_many(classes, ClassView, "class_with_user.json")}
  end

  def render("show.json", %{class: class}) do
    %{data: render_one(class, ClassView, "class_with_user.json")}
  end

  def render("class.json", %{class: class}) do
    %{
      id: class.id,
      name: class.name,
      description: class.description,
      start_date: class.start_date,
      end_date: class.end_date,
      course_banner: class.course_banner,
    }
  end

  def render("class_with_user.json", %{class: class}) do
    %{
      id: class.id,
      name: class.name,
      user: render_one(class.user, UserView, "user.json"),
      description: class.description,
      start_date: class.start_date,
      end_date: class.end_date,
      course_banner: class.course_banner,
    }
  end

  def render("classes.json", %{classes: classes}) do
#    %{
#      id: classes.id,
#      name: classes.name,
#      description: classes.description,
#      start_date: classes.start_date,
#      end_date: classes.end_date,
#      course_banner: classes.course_banner,
#    }
    %{data: render_many(classes, ClassView, "class.json")}

  end
end
