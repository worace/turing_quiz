require 'test_helper'

class Admin::HintsControllerTest < ActionController::TestCase
  setup do
    quiz = Quiz.create(title: "my quiz", slug: "my-quiz")
    @q = Question.create(quiz: quiz, body: "heres a question")
    @hint = Hint.create(question: @q)
  end

  test "should get new" do
    get :new, question_id: @q.id
    assert_response :success
  end

  test "should create hint" do
    assert_difference('Hint.count') do
      post :create, question_id: @q.id, hint: { body: @hint.body, question_id: @hint.question_id }
    end

    assert_redirected_to admin_quiz_path(@q.quiz)
  end

  test "should get edit" do
    get :edit, id: @hint
    assert_response :success
  end

  test "should update hint" do
    patch :update, id: @hint, hint: { body: @hint.body, question_id: @hint.question_id }
    assert_redirected_to admin_quiz_path(@q.quiz)
  end

  test "should destroy hint" do
    assert_difference('Hint.count', -1) do
      delete :destroy, id: @hint
    end

    assert_redirected_to admin_quiz_path(@q.quiz)
  end
end
