require 'test_helper'

class Admin::QuizzesControllerTest < ActionController::TestCase
  setup do
    @quiz = Quiz.create(title: "my quiz", slug: "my-quiz")
  end

  test "should get new" do
    get :new, quiz: @quiz
    assert_response :success
  end

  test "should create quiz" do
    assert_difference('Quiz.count') do
      post :create, quiz: { slug: "new-slug", title: "new quiz title" }
    end

    assert_redirected_to admin_quiz_path(assigns(:quiz))
  end

  test "should get edit" do
    get :edit, id: @quiz.slug
    assert_response :success
  end

  test "should update quiz" do
    patch :update, id: @quiz.slug, quiz: { slug: @quiz.slug, title: @quiz.title }
    assert_redirected_to admin_quiz_path(assigns(:quiz))
  end

  test "should destroy quiz" do
    assert_difference('Quiz.count', -1) do
      delete :destroy, id: @quiz.slug
    end

    assert_redirected_to admin_quizzes_path
  end
end
