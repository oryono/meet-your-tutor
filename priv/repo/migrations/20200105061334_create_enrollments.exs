defmodule MeetYourTutor.Repo.Migrations.CreateEnrollments do
  use Ecto.Migration

  def change do
    create table(:enrollments) do
      add :class_id, references(:classes)
      add :user_id, references(:users)

      timestamps()
    end

    create unique_index(:enrollments, [:class_id, :user_id], name: :enrollments_class_id_user_id_constraint)

  end
end
