defmodule MeetYourTutorWeb.ClassControllerTest do
  use MeetYourTutorWeb.ConnCase

  alias MeetYourTutor.Courses
  alias MeetYourTutor.Courses.Class

  @create_attrs %{
    course_id: 42,
    course_poster: "some course_poster",
    description: "some description",
    end_date: ~D[2010-04-17],
    start_date: ~D[2010-04-17]
  }
  @update_attrs %{
    course_id: 43,
    course_poster: "some updated course_poster",
    description: "some updated description",
    end_date: ~D[2011-05-18],
    start_date: ~D[2011-05-18]
  }
  @invalid_attrs %{course_id: nil, course_poster: nil, description: nil, end_date: nil, start_date: nil}

  def fixture(:class) do
    {:ok, class} = Courses.create_class(@create_attrs)
    class
  end

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "index" do
    test "lists all classes", %{conn: conn} do
      conn = get(conn, Routes.class_path(conn, :index))
      assert json_response(conn, 200)["data"] == []
    end
  end

  describe "create class" do
    test "renders class when data is valid", %{conn: conn} do
      conn = post(conn, Routes.class_path(conn, :create), class: @create_attrs)
      assert %{"id" => id} = json_response(conn, 201)["data"]

      conn = get(conn, Routes.class_path(conn, :show, id))

      assert %{
               "id" => id,
               "course_id" => 42,
               "course_poster" => "some course_poster",
               "description" => "some description",
               "end_date" => "2010-04-17",
               "start_date" => "2010-04-17"
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.class_path(conn, :create), class: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "update class" do
    setup [:create_class]

    test "renders class when data is valid", %{conn: conn, class: %Class{id: id} = class} do
      conn = put(conn, Routes.class_path(conn, :update, class), class: @update_attrs)
      assert %{"id" => ^id} = json_response(conn, 200)["data"]

      conn = get(conn, Routes.class_path(conn, :show, id))

      assert %{
               "id" => id,
               "course_id" => 43,
               "course_poster" => "some updated course_poster",
               "description" => "some updated description",
               "end_date" => "2011-05-18",
               "start_date" => "2011-05-18"
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn, class: class} do
      conn = put(conn, Routes.class_path(conn, :update, class), class: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "delete class" do
    setup [:create_class]

    test "deletes chosen class", %{conn: conn, class: class} do
      conn = delete(conn, Routes.class_path(conn, :delete, class))
      assert response(conn, 204)

      assert_error_sent 404, fn ->
        get(conn, Routes.class_path(conn, :show, class))
      end
    end
  end

  defp create_class(_) do
    class = fixture(:class)
    {:ok, class: class}
  end
end
