require 'test_helper'

class QuestionsControllerTest < ActionController::TestCase
  setup do
    @question = questions(:one)
    @quiz = quizzes(:one)
  end

  test "should get index" do
    get :index, quiz_id: @quiz.id
    assert_response :success
    assert_not_nil assigns(:questions)
  end

  test "should get new" do
    get :new, quiz_id: @quiz.id
    assert_response :success
  end

  test "should create question" do
    assert_difference('Question.count') do
      post :create, quiz_id: @quiz.id, question: { body: @question.body, quiz_id: @question.quiz_id }
    end

    assert_redirected_to quiz_path(@quiz)
  end

  test "should show question" do
    get :show, id: @question, quiz_id: @quiz.id
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @question
    assert_response :success
  end

  test "should update question" do
    patch :update, id: @question, question: { body: @question.body, quiz_id: @question.quiz_id }
    assert_redirected_to question_path(assigns(:question))
  end

  test "should destroy question" do
    assert_difference('Question.count', -1) do
      delete :destroy, id: @question
    end

    assert_redirected_to questions_path
  end
end
