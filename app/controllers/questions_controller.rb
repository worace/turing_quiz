class QuestionsController < ApplicationController
  before_action :set_quiz, only: [:index, :new, :create, :show]
  before_action :set_question, only: [:show, :edit, :update, :destroy]

  def index
    @questions = @quiz.questions
  end

  def show
  end

  def new
    @question = Question.new(:quiz => @quiz)
  end

  def edit
  end

  def create
    @question = Question.new(question_params.merge(:quiz => @quiz))

    if @question.save
      redirect_to quiz_path(@quiz), notice: 'Question was successfully created.'
    else
      render :new
    end
  end

  def update
    if @question.update(question_params)
      redirect_to @question, notice: 'Question was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @question.destroy
    redirect_to questions_url, notice: 'Question was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_question
      @question = Question.find(params[:id])
    end

    def set_quiz
      @quiz = Quiz.find(params[:quiz_id])
    end

    # Only allow a trusted parameter "white list" through.
    def question_params
      params.require(:question).permit(:body, :quiz_id)
    end
end
