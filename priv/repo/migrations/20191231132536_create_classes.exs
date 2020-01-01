defmodule MeetYourTutor.Repo.Migrations.CreateClasses do
  use Ecto.Migration

  def change do
    create table(:classes) do
      add :course_id, :integer
      add :description, :text
      add :start_date, :date
      add :user_id, :integer
      add :location, :string
      add :end_date, :date
      add :course_poster, :string

      timestamps()
    end

  end
end
