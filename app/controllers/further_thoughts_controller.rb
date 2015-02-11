class FurtherThoughtsController < ApplicationController
  include QuestionNested
  before_action :set_further_thought, only: [:show, :edit, :update, :destroy]

  # GET /further_thoughts/new
  def new
    @further_thought = FurtherThought.new
  end

  # GET /further_thoughts/1/edit
  def edit
  end

  # POST /further_thoughts
  def create
    @further_thought = FurtherThought.new(further_thought_params)

    if @further_thought.save
      redirect_to quiz_path(@further_thought.quiz), notice: 'Further thought was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /further_thoughts/1
  def update
    if @further_thought.update(further_thought_params)
      redirect_to quiz_path(@further_thought.quiz), notice: 'Further thought was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /further_thoughts/1
  def destroy
    @further_thought.destroy
    redirect_to quiz_path(@further_thought.quiz), notice: 'Further thought was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_further_thought
      @further_thought = FurtherThought.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def further_thought_params
      params.require(:further_thought).permit(:body, :question_id)
    end
end
