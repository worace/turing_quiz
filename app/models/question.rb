class Question < ActiveRecord::Base
  belongs_to :quiz
  has_many :options
  has_many :hints
  has_many :answers
  has_many :further_thoughts
  validates_presence_of :quiz_id

  def resources
    options + hints + answers + further_thoughts
  end
end
