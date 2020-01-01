defmodule MeetYourTutor.Courses.Class do
  use Ecto.Schema
  import Ecto.Changeset

  schema "classes" do
    field :course_id, :integer
    field :course_poster, :string
    field :description, :string
    field :user_id, :integer
    field :location, :string
    field :end_date, :date
    field :start_date, :date

    timestamps()
  end

  @doc false
  def changeset(class, attrs) do
    class
    |> cast(attrs, [:course_id, :description, :start_date, :end_date, :course_poster])
    |> validate_required([:course_id, :description, :start_date, :end_date, :course_poster])
  end
end
