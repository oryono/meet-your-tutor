defmodule MeetYourTutor.Courses.Enrollment do
  use Ecto.Schema
  import Ecto.Changeset

  schema "enrollments" do
    belongs_to :class, MeetYourTutor.Courses.Class
    belongs_to :user, MeetYourTutor.Accounts.User

    timestamps()
  end

  @doc false
  def changeset(enrollment, attrs) do
    enrollment
    |> cast(attrs, [:class_id, :user_id])
    |> validate_required([:class_id, :user_id])
    |> unique_constraint(:email_class_constraint, name: :enrollments_class_id_user_id_constraint, message: "User can't enroll for same class more than once")
    |> foreign_key_constraint(:class_id)
    |> foreign_key_constraint(:user_id)
  end
end
