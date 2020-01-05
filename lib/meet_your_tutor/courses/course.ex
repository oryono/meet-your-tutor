defmodule MeetYourTutor.Courses.Course do
  use Ecto.Schema
  import Ecto.Changeset

  schema "courses" do
    field :description, :string
    field :name, :string

    belongs_to :category, MeetYourTutor.Courses.Category

    timestamps()
  end

  @doc false
  def changeset(course, attrs) do
    course
    |> cast(attrs, [:name, :category_id])
    |> validate_required([:name, :category_id])
  end
end
