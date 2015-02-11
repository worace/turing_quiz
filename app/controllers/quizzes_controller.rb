class QuizzesController < ApplicationController
  before_action :set_quiz

  def show
  end

  def set_quiz
    @quiz = Quiz.find(params[:id])
  end
end
