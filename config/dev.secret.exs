use Mix.Config

# Configure your database
config :meet_your_tutor, MeetYourTutor.Repo,
       username: "postgres",
       password: "postgres",
       database: "meet_your_tutor_dev",
       hostname: "db",
       show_sensitive_data_on_connection_error: true,
       pool_size: 10