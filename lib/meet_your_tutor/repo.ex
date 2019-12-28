defmodule MeetYourTutor.Repo do
  use Ecto.Repo,
    otp_app: :meet_your_tutor,
    adapter: Ecto.Adapters.Postgres
end
