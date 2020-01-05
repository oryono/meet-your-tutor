defmodule MeetYourTutor.Repo.Migrations.CreateClasses do
  use Ecto.Migration

  def change do
    create table(:classes) do
      add :course_id, references(:courses)
      add :description, :text
      add :start_date, :naive_datetime, default: fragment("now()")
      add :user_id, references(:users)
      add :location, :string
      add :end_date, :naive_datetime, default: fragment("now()")
      add :course_banner, :string, default: nil


      timestamps()
    end

    create unique_index(:classes, [:course_id, :user_id], name: :classes_course_id_user_id_constraint)

  end
end
