defmodule MeetYourTutorWeb.Auth.Pipeline do
  use Guardian.Plug.Pipeline,
      otp_app: :meet_your_tutor,
      module: MeetYourTutorWeb.Guardian,
      error_handler: MeetYourTutorWeb.Auth.ErrorHandler

  plug Guardian.Plug.VerifyHeader
  plug Guardian.Plug.EnsureAuthenticated
  plug Guardian.Plug.LoadResource
end