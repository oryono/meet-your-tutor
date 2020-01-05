defmodule MeetYourTutor.CoursesTest do
  use MeetYourTutor.DataCase

  alias MeetYourTutor.Courses

  describe "courses" do
    alias MeetYourTutor.Courses.Course

    @valid_attrs %{category_id: 42, description: "some description", name: "some name"}
    @update_attrs %{category_id: 43, description: "some updated description", name: "some updated name"}
    @invalid_attrs %{category_id: nil, description: nil, name: nil}

    def course_fixture(attrs \\ %{}) do
      {:ok, course} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Courses.create_course()

      course
    end

    test "list_courses/0 returns all courses" do
      course = course_fixture()
      assert Courses.list_courses() == [course]
    end

    test "get_course!/1 returns the course with given id" do
      course = course_fixture()
      assert Courses.get_course!(course.id) == course
    end

    test "create_course/1 with valid data creates a course" do
      assert {:ok, %Course{} = course} = Courses.create_course(@valid_attrs)
      assert course.category_id == 42
      assert course.description == "some description"
      assert course.name == "some name"
    end

    test "create_course/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Courses.create_course(@invalid_attrs)
    end

    test "update_course/2 with valid data updates the course" do
      course = course_fixture()
      assert {:ok, %Course{} = course} = Courses.update_course(course, @update_attrs)
      assert course.category_id == 43
      assert course.description == "some updated description"
      assert course.name == "some updated name"
    end

    test "update_course/2 with invalid data returns error changeset" do
      course = course_fixture()
      assert {:error, %Ecto.Changeset{}} = Courses.update_course(course, @invalid_attrs)
      assert course == Courses.get_course!(course.id)
    end

    test "delete_course/1 deletes the course" do
      course = course_fixture()
      assert {:ok, %Course{}} = Courses.delete_course(course)
      assert_raise Ecto.NoResultsError, fn -> Courses.get_course!(course.id) end
    end

    test "change_course/1 returns a course changeset" do
      course = course_fixture()
      assert %Ecto.Changeset{} = Courses.change_course(course)
    end
  end

  describe "categories" do
    alias MeetYourTutor.Courses.Category

    @valid_attrs %{description: "some description", name: "some name"}
    @update_attrs %{description: "some updated description", name: "some updated name"}
    @invalid_attrs %{description: nil, name: nil}

    def category_fixture(attrs \\ %{}) do
      {:ok, category} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Courses.create_category()

      category
    end

    test "list_categories/0 returns all categories" do
      category = category_fixture()
      assert Courses.list_categories() == [category]
    end

    test "get_category!/1 returns the category with given id" do
      category = category_fixture()
      assert Courses.get_category!(category.id) == category
    end

    test "create_category/1 with valid data creates a category" do
      assert {:ok, %Category{} = category} = Courses.create_category(@valid_attrs)
      assert category.description == "some description"
      assert category.name == "some name"
    end

    test "create_category/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Courses.create_category(@invalid_attrs)
    end

    test "update_category/2 with valid data updates the category" do
      category = category_fixture()
      assert {:ok, %Category{} = category} = Courses.update_category(category, @update_attrs)
      assert category.description == "some updated description"
      assert category.name == "some updated name"
    end

    test "update_category/2 with invalid data returns error changeset" do
      category = category_fixture()
      assert {:error, %Ecto.Changeset{}} = Courses.update_category(category, @invalid_attrs)
      assert category == Courses.get_category!(category.id)
    end

    test "delete_category/1 deletes the category" do
      category = category_fixture()
      assert {:ok, %Category{}} = Courses.delete_category(category)
      assert_raise Ecto.NoResultsError, fn -> Courses.get_category!(category.id) end
    end

    test "change_category/1 returns a category changeset" do
      category = category_fixture()
      assert %Ecto.Changeset{} = Courses.change_category(category)
    end
  end

  describe "classes" do
    alias MeetYourTutor.Courses.Class

    @valid_attrs %{course_id: 42, course_poster: "some course_poster", description: "some description", end_date: ~D[2010-04-17], start_date: ~D[2010-04-17]}
    @update_attrs %{course_id: 43, course_poster: "some updated course_poster", description: "some updated description", end_date: ~D[2011-05-18], start_date: ~D[2011-05-18]}
    @invalid_attrs %{course_id: nil, course_poster: nil, description: nil, end_date: nil, start_date: nil}

    def class_fixture(attrs \\ %{}) do
      {:ok, class} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Courses.create_class()

      class
    end

    test "list_classes/0 returns all classes" do
      class = class_fixture()
      assert Courses.list_classes() == [class]
    end

    test "get_class!/1 returns the class with given id" do
      class = class_fixture()
      assert Courses.get_class!(class.id) == class
    end

    test "create_class/1 with valid data creates a class" do
      assert {:ok, %Class{} = class} = Courses.create_class(@valid_attrs)
      assert class.course_id == 42
      assert class.course_poster == "some course_poster"
      assert class.description == "some description"
      assert class.end_date == ~D[2010-04-17]
      assert class.start_date == ~D[2010-04-17]
    end

    test "create_class/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Courses.create_class(@invalid_attrs)
    end

    test "update_class/2 with valid data updates the class" do
      class = class_fixture()
      assert {:ok, %Class{} = class} = Courses.update_class(class, @update_attrs)
      assert class.course_id == 43
      assert class.course_poster == "some updated course_poster"
      assert class.description == "some updated description"
      assert class.end_date == ~D[2011-05-18]
      assert class.start_date == ~D[2011-05-18]
    end

    test "update_class/2 with invalid data returns error changeset" do
      class = class_fixture()
      assert {:error, %Ecto.Changeset{}} = Courses.update_class(class, @invalid_attrs)
      assert class == Courses.get_class!(class.id)
    end

    test "delete_class/1 deletes the class" do
      class = class_fixture()
      assert {:ok, %Class{}} = Courses.delete_class(class)
      assert_raise Ecto.NoResultsError, fn -> Courses.get_class!(class.id) end
    end

    test "change_class/1 returns a class changeset" do
      class = class_fixture()
      assert %Ecto.Changeset{} = Courses.change_class(class)
    end
  end

  describe "enrollments" do
    alias MeetYourTutor.Courses.Enrollment

    @valid_attrs %{course_id: 42, user_id: 42}
    @update_attrs %{course_id: 43, user_id: 43}
    @invalid_attrs %{course_id: nil, user_id: nil}

    def enrollment_fixture(attrs \\ %{}) do
      {:ok, enrollment} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Courses.create_enrollment()

      enrollment
    end

    test "list_enrollments/0 returns all enrollments" do
      enrollment = enrollment_fixture()
      assert Courses.list_enrollments() == [enrollment]
    end

    test "get_enrollment!/1 returns the enrollment with given id" do
      enrollment = enrollment_fixture()
      assert Courses.get_enrollment!(enrollment.id) == enrollment
    end

    test "create_enrollment/1 with valid data creates a enrollment" do
      assert {:ok, %Enrollment{} = enrollment} = Courses.create_enrollment(@valid_attrs)
      assert enrollment.course_id == 42
      assert enrollment.user_id == 42
    end

    test "create_enrollment/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Courses.create_enrollment(@invalid_attrs)
    end

    test "update_enrollment/2 with valid data updates the enrollment" do
      enrollment = enrollment_fixture()
      assert {:ok, %Enrollment{} = enrollment} = Courses.update_enrollment(enrollment, @update_attrs)
      assert enrollment.course_id == 43
      assert enrollment.user_id == 43
    end

    test "update_enrollment/2 with invalid data returns error changeset" do
      enrollment = enrollment_fixture()
      assert {:error, %Ecto.Changeset{}} = Courses.update_enrollment(enrollment, @invalid_attrs)
      assert enrollment == Courses.get_enrollment!(enrollment.id)
    end

    test "delete_enrollment/1 deletes the enrollment" do
      enrollment = enrollment_fixture()
      assert {:ok, %Enrollment{}} = Courses.delete_enrollment(enrollment)
      assert_raise Ecto.NoResultsError, fn -> Courses.get_enrollment!(enrollment.id) end
    end

    test "change_enrollment/1 returns a enrollment changeset" do
      enrollment = enrollment_fixture()
      assert %Ecto.Changeset{} = Courses.change_enrollment(enrollment)
    end
  end
end
