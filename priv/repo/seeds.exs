# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     MeetYourTutor.Repo.insert!(%MeetYourTutor.SomeSchema{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.

if Mix.env == :dev do
  # Truncate table
  MeetYourTutor.Repo.query("TRUNCATE users CASCADE")
  MeetYourTutor.Repo.query("TRUNCATE categories CASCADE")
  MeetYourTutor.Repo.query("TRUNCATE courses CASCADE")
  MeetYourTutor.Repo.query("TRUNCATE classes CASCADE")

  #  Users
  MeetYourTutor.Accounts.create_user(%{name: "Patrick Oryono", email: "patricken08@gmail.com", password: "secret"})
  MeetYourTutor.Accounts.create_user(%{name: "Scovia Akwii", email: "scovia@gmail.com", password: "secret"})
  MeetYourTutor.Accounts.create_user(%{name: "Christine Achieng", email: "christine@gmail.com", password: "secret"})
  MeetYourTutor.Accounts.create_user(%{name: "Patricia Awilli", email: "patricia@gmail.com", password: "secret"})
  MeetYourTutor.Accounts.create_user(%{name: "Agatha Mwine", email: "agatha@gmail.com", password: "secret"})
  #  Categories
  MeetYourTutor.Courses.create_category(%{name: "Languages"})
  MeetYourTutor.Courses.create_category(%{name: "Software Engineering"})
  MeetYourTutor.Courses.create_category(%{name: "Business"})
  MeetYourTutor.Courses.create_category(%{name: "Math"})
  MeetYourTutor.Courses.create_category(%{name: "Health"})

  # Courses
  MeetYourTutor.Courses.create_course(%{name: "Introduction to Elixir", category_id: 2})
  MeetYourTutor.Courses.create_course(%{name: "Introduction to Laravel", category_id: 2})
  MeetYourTutor.Courses.create_course(%{name: "Introduction to Vue", category_id: 2})
  MeetYourTutor.Courses.create_course(%{name: "Introduction to React.js", category_id: 2})
  MeetYourTutor.Courses.create_course(%{name: "Introduction to Functional Programming", category_id: 2})
  MeetYourTutor.Courses.create_course(%{name: "Introduction to German", category_id: 1})
  MeetYourTutor.Courses.create_course(%{name: "Introduction to French", category_id: 1})
  MeetYourTutor.Courses.create_course(%{name: "Introduction to Algebra", category_id: 4})

  # Classes
  MeetYourTutor.Courses.create_class(%{course_id: 1, location: "Kampala", user_id: 1})
  MeetYourTutor.Courses.create_class(%{course_id: 2, location: "Kampala", user_id: 2})
  MeetYourTutor.Courses.create_class(%{course_id: 3, location: "Kampala", user_id: 3})
  MeetYourTutor.Courses.create_class(%{course_id: 4, location: "Kampala", user_id: 4})
  MeetYourTutor.Courses.create_class(%{course_id: 5, location: "Kampala", user_id: 5})

end
