defmodule MeetYourTutor.Courses.Class do
  use Ecto.Schema
  import Ecto.Changeset

  schema "classes" do
    field :course_banner, :string
    field :description, :string
    field :location, :string
    field :end_date, :naive_datetime
    field :start_date, :naive_datetime
    field :name, :string
    belongs_to :user, MeetYourTutor.Accounts.User

    timestamps()
  end

  @doc false
  def changeset(class, attrs) do
    class
    |> cast(attrs, [:name, :description, :start_date, :end_date, :course_banner, :user_id, :location])
    |> validate_required([:name, :user_id, :location])
    |>  foreign_key_constraint(:user_id)
  end
end
