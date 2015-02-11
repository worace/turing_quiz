require 'test_helper'

class Admin::QuestionsControllerTest < ActionController::TestCase
  setup do
    @quiz = Quiz.create(title: "my quiz", slug: "my-quiz")
    @question = Question.create(body: "question", quiz: @quiz)
  end

  test "should get new" do
    get :new, quiz_id: @quiz.id
    assert_response :success
  end

  test "should create question" do
    assert_difference('Question.count') do
      post :create, quiz_id: @quiz.id, question: { body: @question.body, quiz_id: @question.quiz_id }
    end

    assert_redirected_to admin_quiz_path(@quiz)
  end

  test "should get edit" do
    get :edit, id: @question
    assert_response :success
  end

  test "should update question" do
    patch :update, id: @question, question: { body: @question.body, quiz_id: @question.quiz_id }
    assert_redirected_to admin_quiz_path(assigns(:question).quiz)
  end

  test "should destroy question" do
    assert_difference('Question.count', -1) do
      delete :destroy, id: @question
    end

    assert_redirected_to admin_quiz_path(@quiz)
  end
end
