require 'test_helper'

class AnswersControllerTest < ActionController::TestCase
  setup do
    quiz = Quiz.create(title: "my quiz", slug: "my-quiz")
    @question = Question.create(quiz: quiz, body: "heres a question")
    @answer = Answer.create(question: @question, body: "here's an answer")
  end

  test "should get new" do
    get :new, question_id: @question.id
    assert_response :success
  end

  test "should create answer" do
    assert_difference('Answer.count') do
      post :create, question_id: @question.id, answer: { body: @answer.body, question_id: @answer.question_id }
    end

    assert_equal @question, Answer.last.question

    assert_redirected_to quiz_path(@question.quiz)
  end

  test "should get edit" do
    get :edit, id: @answer
    assert_response :success
  end

  test "should update answer" do
    patch :update, id: @answer, answer: { body: @answer.body, question_id: @answer.question_id }
    assert_redirected_to quiz_path(@question.quiz)
  end

  test "should destroy answer" do
    assert_difference('Answer.count', -1) do
      delete :destroy, id: @answer
    end

    assert_redirected_to quiz_path(@question.quiz)
  end
end
