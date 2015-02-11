require_relative "../test_helper"
require "minitest/rails/capybara"

class ViewQuizTest < Capybara::Rails::TestCase
  def setup
    @quiz = Quiz.create(title: "my quiz", slug: "my-quiz")
    @question = Question.create(body: "What's the meaning of life", quiz: @quiz)
    Option.create(question: @question, body: "a) To crush your enemies and hear the lamentations of their women")
    Option.create(question: @question, body: "b) meh")
    Answer.create(question: @question, body: "a) To crush your enemies")
    Hint.create(question: @question, body: "What would conan do?")
    FurtherThought.create(question: @question, body: "It helps to have exceedingly large pectorals.")
  end

  def test_includes_questions_options_hints_further_thought
    visit quiz_path(@quiz)
    assert page.has_content?(@quiz.title)
    @question.resources.each do |r|
      assert page.has_content?(r.body)
    end
  end
end
