require 'test_helper'

class Admin::OptionsControllerTest < ActionController::TestCase
  setup do
    quiz = Quiz.create(title: "my quiz", slug: "my-quiz")
    @q = Question.create(quiz: quiz, body: "heres a question")
    @option = Option.create(question: @q)
  end

  test "should get new" do
    get :new, question_id: @q.id
    assert_response :success
  end

  test "should create option" do
    assert_difference('Option.count') do
      post :create, question_id: @q.id, option: { body: @option.body, question_id: @option.question_id }
    end

    assert_redirected_to admin_quiz_path(@q.quiz)
  end

  test "should get edit" do
    get :edit, id: @option
    assert_response :success
  end

  test "should update option" do
    patch :update, id: @option, option: { body: @option.body, question_id: @option.question_id }
    assert_redirected_to admin_quiz_path(@q.quiz)
  end

  test "should destroy option" do
    assert_difference('Option.count', -1) do
      delete :destroy, id: @option
    end

    assert_redirected_to admin_quiz_path(@q.quiz)
  end
end
