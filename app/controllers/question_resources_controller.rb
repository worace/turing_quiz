class QuestionResourcesController < ApplicationController
  include QuestionNested
  before_action :set_resource, only: [:show, :edit, :update, :destroy]

  def new
    @resource = resource.new(question: @question)
    render :template => "question_resources/new"
  end

  def edit
    render :template => "question_resources/edit"
  end

  def create
    @resource = resource.new(resource_params.merge({question: @question}))

    if @resource.save
      redirect_to quiz_path(@resource.quiz), notice: "#{resource.class.name} was successfully created."
    else
      render :template => "question_resources/new"
    end
  end

  def update
    if @resource.update(resource_params)
      redirect_to quiz_path(@resource.quiz), notice: "#{resource.class.name} was successfully updated."
    else
      render :template => "question_resources/edit"
    end
  end

  # DELETE /further_thoughts/1
  def destroy
    @resource.destroy
    redirect_to quiz_path(@resource.quiz), notice: "#{resource.class.name} was successfully destroyed."
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_resource
      @resource = resource.find(params[:id])
    end

    def resource
      raise "Abstract -- return class that this controller manages"
    end

    # Only allow a trusted parameter "white list" through.
    def resource_params
      params.require(resource.name.underscore).permit(:body)
    end
end
