defmodule MeetYourTutor.Courses.Class do
  use Ecto.Schema
  import Ecto.Changeset

  schema "classes" do
    field :course_banner, :string
    field :description, :string
    field :location, :string
    field :end_date, :naive_datetime
    field :start_date, :naive_datetime

    belongs_to :course, MeetYourTutor.Courses.Course
    belongs_to :user, MeetYourTutor.Accounts.User

    timestamps()
  end

  @doc false
  def changeset(class, attrs) do
    class
    |> cast(attrs, [:course_id, :description, :start_date, :end_date, :course_banner, :user_id, :location])
    |> validate_required([:course_id, :user_id, :location])
    |>  foreign_key_constraint(:course_id)
  end
end
