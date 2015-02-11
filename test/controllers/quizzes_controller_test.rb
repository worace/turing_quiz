require 'test_helper'

class QuizzesControllerTest < ActionController::TestCase
  setup do
    @quiz = Quiz.create(title: "my quiz", slug: "my-quiz")
  end

  test "should get new" do
    get :new, quiz: @quiz
    assert_response :success
  end

  test "should create quiz" do
    assert_difference('Quiz.count') do
      post :create, quiz: { slug: @quiz.slug, title: @quiz.title }
    end

    assert_redirected_to quiz_path(assigns(:quiz))
  end

  test "should get edit" do
    get :edit, id: @quiz
    assert_response :success
  end

  test "should update quiz" do
    patch :update, id: @quiz, quiz: { slug: @quiz.slug, title: @quiz.title }
    assert_redirected_to quiz_path(assigns(:quiz))
  end

  test "should destroy quiz" do
    assert_difference('Quiz.count', -1) do
      delete :destroy, id: @quiz
    end

    assert_redirected_to quizzes_path
  end
end
