require "test_helper"
require "minitest/rails/capybara"

class CrudTest < Capybara::Rails::TestCase
  def test_creates_a_quiz
    visit new_admin_quiz_path
    page.fill_in "quiz_title", with: "Pizza Quiz"
    page.fill_in "quiz_slug", with: "pizza-quiz"
    click_button "Create Quiz"
    assert_equal admin_quiz_path(Quiz.last), current_path
    assert page.has_content?("Pizza Quiz")
    assert_equal "Pizza Quiz", Quiz.last.title
  end

  def test_adds_questions
    q = Quiz.create(title: "Pizza Quiz", slug: "pizza-quiz")
    visit admin_quiz_path(q)
    click_link("Add Question")
    page.fill_in "question_body", with: "How many slices are in a pizza?"
    click_button "Create Question"
    assert_equal "How many slices are in a pizza?", q.questions.last.body
  end

  def test_lists_questions_on_quiz_page
    q = Quiz.create(title: "Pizza Quiz", slug: "pizza-quiz")
    Question.create(quiz: q, body: "How many pizzas in a slice?")
    visit admin_quiz_path(q)
    assert page.has_content?("How many pizzas in a slice?")
  end

  def test_adds_answer_to_question
    q = Quiz.create(title: "Pizza Quiz", slug: "pizza-quiz")
    Question.create(quiz: q, body: "How many pizzas in a slice?")
    visit admin_quiz_path(q)
    click_link("add answer")
    fill_in "answer_body", with: "trick question: the slice is in your mind"
    click_button "Create Answer"
    assert_equal admin_quiz_path(q), current_path
    assert_equal "trick question: the slice is in your mind", q.questions.last.answers.first.body
    assert page.has_content?("trick question: the slice is in your mind")
  end
end
