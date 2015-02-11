class QuizzesController < ApplicationController
  before_action :set_quiz

  def show
  end

  def set_quiz
    @quiz = Quiz.find_by(slug: params[:id])
  end
end
