defmodule MeetYourTutor.Courses.Enrollment do
  use Ecto.Schema
  import Ecto.Changeset

  schema "enrollments" do
    belongs_to :course, MeetYourTutor.Courses.Course
    belongs_to :user, MeetYourTutor.Accounts.User

    timestamps()
  end

  @doc false
  def changeset(enrollment, attrs) do
    enrollment
    |> cast(attrs, [:course_id, :user_id])
    |> validate_required([:course_id, :user_id])
    |> unique_constraint(:email_class, name: :enrollments_course_id_user_id_constraint)
  end
end
