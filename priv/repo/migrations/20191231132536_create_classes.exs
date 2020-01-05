defmodule MeetYourTutor.Repo.Migrations.CreateClasses do
  use Ecto.Migration

  def change do
    create table(:classes) do
      add :name, :string
      add :description, :text
      add :category_id, references(:categories, on_delete: :nothing)
      add :start_date, :naive_datetime, default: fragment("now()")
      add :user_id, references(:users)
      add :location, :string
      add :end_date, :naive_datetime, default: fragment("now()")
      add :course_banner, :string, default: nil


      timestamps()
    end

    create unique_index(:classes, [:name, :user_id], name: :classes_name_user_id_constraint)

  end
end
