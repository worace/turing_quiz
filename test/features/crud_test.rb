require "test_helper"
require "minitest/rails/capybara"

class CrudTest < Capybara::Rails::TestCase
  def test_creates_a_quiz
    visit new_quiz_path
    page.fill_in "quiz_title", with: "Pizza Quiz"
    page.fill_in "quiz_slug", with: "pizza-quiz"
    click_button "Create Quiz"
    assert_equal quiz_path(Quiz.last), current_path
    assert page.has_content?("Pizza Quiz")
    assert_equal "Pizza Quiz", Quiz.last.title
  end

  def test_adds_questions
    q = Quiz.create(title: "Pizza Quiz", slug: "pizza-quiz")
    visit quiz_path(q)
    click_link("Add Question")
    page.fill_in "question_body", with: "How many slices are in a pizza?"
    click_button "Create Question"
  end

  def test_lists_questions_on_quiz_page
    q = Quiz.create(title: "Pizza Quiz", slug: "pizza-quiz")
    Question.create(quiz: q, body: "How many pizzas in a slice?")
    visit quiz_path(q)
    assert page.has_content?("How many pizzas in a slice?")
  end
end
