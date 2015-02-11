module QuestionChild
  def self.included(base)
    base.send(:belongs_to, :question)
    base.send(:validates_presence_of, :question_id)
  end

  def quiz
    question.quiz
  end
end
