class HintsController < ApplicationController
  include QuestionNested
  before_action :set_hint, only: [:show, :edit, :update, :destroy]

  # GET /hints/new
  def new
    @hint = Hint.new
  end

  # GET /hints/1/edit
  def edit
  end

  # POST /hints
  def create
    @hint = Hint.new(hint_params)

    if @hint.save
      redirect_to quiz_path(@question.quiz), notice: 'Hint was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /hints/1
  def update
    if @hint.update(hint_params)
      redirect_to @hint, notice: 'Hint was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /hints/1
  def destroy
    @hint.destroy
    redirect_to quiz_path(@hint.question.quiz), notice: 'Hint was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_hint
      @hint = Hint.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def hint_params
      params.require(:hint).permit(:body, :question_id)
    end
end
