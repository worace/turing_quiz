module QuestionNested
  def self.included(base)
    base.send(:before_action, :set_question, only: [:new, :create])
  end

  def set_question
    @question = Question.find(params[:question_id])
  end
end
