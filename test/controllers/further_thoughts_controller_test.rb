require 'test_helper'

class FurtherThoughtsControllerTest < ActionController::TestCase
  setup do
    quiz = Quiz.create(title: "my quiz", slug: "my-quiz")
    @q = Question.create(quiz: quiz, body: "heres a question")
    @further_thought = FurtherThought.create(question: @q)
  end

  test "should get new" do
    get :new, question_id: @q.id
    assert_response :success
  end

  test "should create further_thought" do
    assert_difference('FurtherThought.count') do
      post :create, question_id: @q.id, further_thought: { body: @further_thought.body, question_id: @further_thought.question_id }
    end

    assert_redirected_to quiz_path(@q.quiz)
  end

  test "should get edit" do
    get :edit, id: @further_thought
    assert_response :success
  end

  test "should update further_thought" do
    patch :update, id: @further_thought, further_thought: { body: @further_thought.body, question_id: @further_thought.question_id }
    assert_redirected_to quiz_path(@q.quiz)
  end

  test "should destroy further_thought" do
    assert_difference('FurtherThought.count', -1) do
      delete :destroy, id: @further_thought
    end

    assert_redirected_to quiz_path(@q.quiz)
  end
end
