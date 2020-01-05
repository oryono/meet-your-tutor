defmodule MeetYourTutorWeb.EnrollmentControllerTest do
  use MeetYourTutorWeb.ConnCase

  alias MeetYourTutor.Courses
  alias MeetYourTutor.Courses.Enrollment

  @create_attrs %{
    course_id: 42,
    user_id: 42
  }
  @update_attrs %{
    course_id: 43,
    user_id: 43
  }
  @invalid_attrs %{course_id: nil, user_id: nil}

  def fixture(:enrollment) do
    {:ok, enrollment} = Courses.create_enrollment(@create_attrs)
    enrollment
  end

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "index" do
    test "lists all enrollments", %{conn: conn} do
      conn = get(conn, Routes.enrollment_path(conn, :index))
      assert json_response(conn, 200)["data"] == []
    end
  end

  describe "create enrollment" do
    test "renders enrollment when data is valid", %{conn: conn} do
      conn = post(conn, Routes.enrollment_path(conn, :create), enrollment: @create_attrs)
      assert %{"id" => id} = json_response(conn, 201)["data"]

      conn = get(conn, Routes.enrollment_path(conn, :show, id))

      assert %{
               "id" => id,
               "course_id" => 42,
               "user_id" => 42
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.enrollment_path(conn, :create), enrollment: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "update enrollment" do
    setup [:create_enrollment]

    test "renders enrollment when data is valid", %{conn: conn, enrollment: %Enrollment{id: id} = enrollment} do
      conn = put(conn, Routes.enrollment_path(conn, :update, enrollment), enrollment: @update_attrs)
      assert %{"id" => ^id} = json_response(conn, 200)["data"]

      conn = get(conn, Routes.enrollment_path(conn, :show, id))

      assert %{
               "id" => id,
               "course_id" => 43,
               "user_id" => 43
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn, enrollment: enrollment} do
      conn = put(conn, Routes.enrollment_path(conn, :update, enrollment), enrollment: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "delete enrollment" do
    setup [:create_enrollment]

    test "deletes chosen enrollment", %{conn: conn, enrollment: enrollment} do
      conn = delete(conn, Routes.enrollment_path(conn, :delete, enrollment))
      assert response(conn, 204)

      assert_error_sent 404, fn ->
        get(conn, Routes.enrollment_path(conn, :show, enrollment))
      end
    end
  end

  defp create_enrollment(_) do
    enrollment = fixture(:enrollment)
    {:ok, enrollment: enrollment}
  end
end
