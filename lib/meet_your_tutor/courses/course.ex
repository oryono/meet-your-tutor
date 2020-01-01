defmodule MeetYourTutor.Courses.Course do
  use Ecto.Schema
  import Ecto.Changeset

  schema "courses" do
    field :category_id, :integer
    field :description, :string
    field :name, :string

    timestamps()
  end

  @doc false
  def changeset(course, attrs) do
    course
    |> cast(attrs, [:name, :description, :category_id])
    |> validate_required([:name, :description, :category_id])
  end
end
